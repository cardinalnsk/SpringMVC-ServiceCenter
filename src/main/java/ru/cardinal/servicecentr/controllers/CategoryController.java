package ru.cardinal.servicecentr.controllers;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ru.cardinal.servicecentr.models.CategoryEntity;
import ru.cardinal.servicecentr.models.DeviceEntity;
import ru.cardinal.servicecentr.services.CategoryService;
import ru.cardinal.servicecentr.services.UserService;

import java.security.Principal;
import java.util.List;

@Controller
@RequestMapping("/category")
@RequiredArgsConstructor
public class CategoryController {
    private final CategoryService categoryService;
    private final UserService userService;

    @PostMapping("/add")
    public String addCategory(@ModelAttribute("CategoryEntity") CategoryEntity entity, Principal principal) {
        categoryService.save(entity);
        return "redirect:/device";
    }

    @GetMapping
    public String listCategories(Model model, Principal principal) {
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        model.addAttribute("categories", categoryService.findAll());
        return "categories";
    }

    @GetMapping("/delete/{id}")
    public String deleteCategory(@PathVariable Long id) {
        categoryService.deleteById(id);
        return "redirect:/category";
    }

    @GetMapping("/{id}")
    public String getDevicesByCategoryId(@PathVariable Long id, Model model, Principal principal) {
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        List<DeviceEntity> deviceByCategory = categoryService.findAllByCategoryId(id);
        model.addAttribute("devices", deviceByCategory);
        return "category";
    }

    @PostMapping("/put/{id}")
    public String updateCategory(@PathVariable Long id, @ModelAttribute("CategoryEntity") CategoryEntity categoryEntity, Principal principal) {
        CategoryEntity category = categoryService.findById(id);
        category.setName(categoryEntity.getName());
        categoryService.save(category);
        System.out.println("principal = " + principal);
        return "redirect:/category";
    }
}
