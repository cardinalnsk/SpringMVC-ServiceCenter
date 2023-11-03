package ru.cardinal.servicecentr.controllers;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import ru.cardinal.servicecentr.models.DeviceEntity;
import ru.cardinal.servicecentr.services.ClientService;
import ru.cardinal.servicecentr.services.UserService;

import java.security.Principal;
import java.util.List;

@Controller
@RequestMapping("/client")
@RequiredArgsConstructor
public class ClientController {
    private final ClientService clientService;
    private final UserService userService;

    @GetMapping
    public String getAll(Model model, Principal principal){
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        model.addAttribute("clients" ,clientService.findAll());
        return "clients";
    }

    @GetMapping("/{id}")
    public String getDevicesByClientId(@PathVariable Long id, Model model, Principal principal) {
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        List<DeviceEntity> deviceByClientId = clientService.findAllByClientId(id);
        model.addAttribute("devices", deviceByClientId);
        return "devices";
    }

    @GetMapping("/delete/{id}")
    public String deleteCategory(@PathVariable Long id) {
        clientService.deleteById(id);
        return "redirect:/client";
    }
}
