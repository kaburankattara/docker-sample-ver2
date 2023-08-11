package com.sample.multiprojectB.infra.kafka;

import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.stereotype.Service;

@Service
public class KafkaService {

    @KafkaListener(id = "kafka-0", topics = "topic")
    public void consumer(String message) {
        System.out.println("kafkaからのメッセージ：" + message);
    }

}
