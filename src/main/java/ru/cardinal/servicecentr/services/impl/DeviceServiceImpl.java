package ru.cardinal.servicecentr.services.impl;

import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import ru.cardinal.servicecentr.models.DeviceEntity;
import ru.cardinal.servicecentr.repositories.DeviceRepo;
import ru.cardinal.servicecentr.services.DeviceService;

import java.io.File;
import java.io.FileOutputStream;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class DeviceServiceImpl implements DeviceService {
  @Value("${upload.path}")
  private String uploadPath;

  private final DeviceRepo deviceRepo;

  @Override
  public List<DeviceEntity> findAll() {
    return deviceRepo.findAll().stream().toList();
  }

  @Override
  public DeviceEntity findByClient_Name(String name) {
    return deviceRepo.findByClient_Name(name);
  }

  @Override
  public void save(DeviceEntity deviceEntity) {
    deviceRepo.save(deviceEntity);
  }

  @Override
  public Optional<DeviceEntity> findById(Long id) {
    return deviceRepo.findById(id);
  }

  @Override
  public void deleteById(Long id) {
    deviceRepo.deleteById(id);
  }

  @SneakyThrows
  @Override
  public void uploadImage(MultipartFile multipartFile, String photoName) {
    File file = new File(uploadPath + "/" + photoName);
    try (FileOutputStream fileOutputStream = new FileOutputStream(file)) {
      fileOutputStream.write(multipartFile.getBytes());
    }
  }

  public List<DeviceEntity> findAllByClientId(Long id) {
    return deviceRepo.findAllByClient_Id(id);
  }
}
