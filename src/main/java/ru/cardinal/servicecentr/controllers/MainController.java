package ru.cardinal.servicecentr.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

//@Controller
//@RequestMapping("/")
public class MainController {
//  @GetMapping
  public String getHomePage() {
    return "devices";
  }
}
