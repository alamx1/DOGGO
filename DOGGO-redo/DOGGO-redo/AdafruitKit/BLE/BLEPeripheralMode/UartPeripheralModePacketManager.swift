//
//  UartPeripheralModePacketManager.swift
//  DOGGO-redo
//
//  Created by Alam Figueroa Aguilar on 11/19/19.
//  Copyright © 2019 Michelle Natasha. All rights reserved.
//

import Foundation

class UartPeripheralModePacketManager: UartPacketManagerBase {

    // MARK: - Send data
    func send(uartPeripheralService: UartPeripheralService, data: Data?/*, completion: ((Error?) -> Void)? = nil*/) {
        sentBytes += Int64(data?.count ?? 0)
        uartPeripheralService.rx = data
    }

    func send(uartPeripheralService: UartPeripheralService, text: String, wasReceivedFromMqtt: Bool = false) {

        #if os(iOS)
        if isMqttEnabled {
            // Mqtt publish to TX
            let mqttSettings = MqttSettings.shared
            if mqttSettings.isPublishEnabled {
                if let topic = mqttSettings.getPublishTopic(index: MqttSettings.PublishFeed.tx.rawValue) {
                    let qos = mqttSettings.getPublishQos(index: MqttSettings.PublishFeed.tx.rawValue)
                    MqttManager.shared.publish(message: text, topic: topic, qos: qos)
                }
            }
        }
        #endif

        // Create data and send to Uart
        if let data = text.data(using: .utf8) {
            let uartPacket = UartPacket(peripheralId: nil, mode: .tx, data: data)

            // Add packet
            packetsSemaphore.wait()
            packets.append(uartPacket)
            packetsSemaphore.signal()

            DispatchQueue.main.async {
                self.delegate?.onUartPacket(uartPacket)
            }

            #if os(iOS)
                let shouldBeSent = !wasReceivedFromMqtt || (isMqttEnabled && MqttSettings.shared.subscribeBehaviour == .transmit)
            #else
                let shouldBeSent = true
            #endif

            if shouldBeSent {
                send(uartPeripheralService: uartPeripheralService, data: data)
            }
            
        }
    }
}
