package com.example.demo;

import com.example.demo.Person;
import org.springframework.stereotype.Controller;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.client.RestTemplate;

@Controller
public class FormController {

    private final RestTemplate restTemplate;
    
    private String baseAPIURL;

    public FormController(RestTemplate restTemplate, @Value("${external.api.url}") String apiUrl) {
        this.restTemplate = restTemplate;
        this.baseAPIURL = apiUrl;
    }

    @GetMapping("/form")
    public String showForm(Model model) {
        model.addAttribute("person", new Person());
        return "form";
    }

    @PostMapping("/submit")
    public String submitForm(@ModelAttribute Person person, Model model) {
        String apiUrl = baseAPIURL + "/api/persons";
        restTemplate.postForObject(apiUrl, person, String.class);
        model.addAttribute("message", "Data submitted successfully!");
        return "form";
    }
}
