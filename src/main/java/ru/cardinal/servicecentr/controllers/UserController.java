package ru.cardinal.servicecentr.controllers;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import ru.cardinal.servicecentr.models.UserEntity;
import ru.cardinal.servicecentr.services.UserService;

@Controller
@RequiredArgsConstructor
@RequestMapping("/user")
public class UserController {

    private final UserService userService;
    @GetMapping("/registration")
    public String registration() {
        return "registration";
    }


    @PostMapping("/registration")
    public String createUser(UserEntity user, Model model) {
        if (!userService.createUser(user)) {
            model.addAttribute("errorMessage", "Пользователь с username: " + user.getUsername() + " уже существует");
            return "registration";
        }
        return "redirect:/login";
    }

    @GetMapping("/change-state/{id}")
    public String changeActive(@PathVariable Long id){
        userService.changeActiveStatus(id);
        return "redirect:/admin";
    }
}
