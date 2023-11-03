package ru.cardinal.servicecentr.controllers;

import lombok.RequiredArgsConstructor;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import ru.cardinal.servicecentr.services.CategoryService;
import ru.cardinal.servicecentr.services.ClientService;
import ru.cardinal.servicecentr.services.DeviceService;
import ru.cardinal.servicecentr.services.UserService;

import java.security.Principal;

@Controller
@Secured("ADMIN")
@RequestMapping("/admin")
@RequiredArgsConstructor
public class SettingsController {
    private final UserService userService;
    private final CategoryService categoryService;
    private final ClientService clientService;
    private final DeviceService deviceService;

    @GetMapping
    public String adminPanel(Model model, Principal principal) {
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        model.addAttribute("users", userService.findAll());
        model.addAttribute("categories", categoryService.findAll());
        model.addAttribute("clients", clientService.findAll());
        model.addAttribute("devices", deviceService.findAll());

        return "admin";
    }
}
