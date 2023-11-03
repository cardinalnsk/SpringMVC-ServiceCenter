package ru.cardinal.servicecentr.controllers;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import ru.cardinal.servicecentr.models.CategoryEntity;
import ru.cardinal.servicecentr.models.Client;
import ru.cardinal.servicecentr.models.DeviceEntity;
import ru.cardinal.servicecentr.repositories.UserRepository;
import ru.cardinal.servicecentr.services.CategoryService;
import ru.cardinal.servicecentr.services.ClientService;
import ru.cardinal.servicecentr.services.DeviceService;
import ru.cardinal.servicecentr.services.UserService;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/device")
@RequiredArgsConstructor
public class DeviceController {

  private final DeviceService deviceService;
  private final CategoryService categoryService;
  private final ClientService clientService;
  private final UserService userService;

  @Value("${upload.path}")
  private String uploadPath;


  @GetMapping
  public String getAllDevices(Model model, Principal principal) {
    var devices = deviceService.findAll();

    model.addAttribute("user", userService.getUserByPrincipal(principal));
    model.addAttribute("devices", devices);
    model.addAttribute("categories", categoryService.findAll());
    model.addAttribute("title", "Devices");
    return "devices";
  }
  @GetMapping("/delete/{id}")
  public String deleteCategory(@PathVariable Long id) {
    deviceService.deleteById(id);
    return "redirect:/device";
  }
  @PostMapping("/add")
  public String addDevice(
          @ModelAttribute("DeviceEntity") DeviceEntity device,
          @RequestParam("name") String name,
          @RequestParam("phone") String phone,
//          @ModelAttribute("Client") Client client,
          @RequestParam("file")
          MultipartFile file) throws IOException {
    if ((file != null) && (file.getSize() != 0)) {
      String uuidFile = UUID.randomUUID().toString();
      String photoName = uuidFile + "." + file.getOriginalFilename();
      deviceService.uploadImage(file, photoName);
//      file.transferTo(new File(photoName));

      device.setFilename(photoName);
    }
    Client client = clientService.findByName(name);
    if (client != null) {
      device.setClient(client);
    } else {
      client.setName(name);
      client.setPhone(phone);
    }
    clientService.saveClient(client);

    device.setClient(client);
    device.setCategory(device.getCategory());
    deviceService.save(device);
    return "redirect:/device";

  }

  @GetMapping("/{id}")
  public String getById(@PathVariable Long id, Model model, Principal principal) {
    var entity = deviceService.findById(id);
    if (entity.isPresent()) {
      var device = entity.get();
      model.addAttribute("device", device);
      model.addAttribute("title", device.getClient().getName());
      model.addAttribute("user", userService.getUserByPrincipal(principal));

    }
    return "device";
  }


}
