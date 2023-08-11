package com.sample.multiprojectA;

import com.sample.multiprojectA.infra.kafka.KafkaConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SampleAController {

    @GetMapping("sampleA")
    @ResponseBody
    public String index() {

        KafkaConfig kafka = new KafkaConfig();
        KafkaTemplate<Integer, String> template = kafka.kafkaTemplate();
        template.send("topic", "aaa");
        String aaa = "aaa";
        return "hello worldA";
    }
}