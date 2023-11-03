package ru.cardinal.servicecentr.services;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import ru.cardinal.servicecentr.models.DeviceEntity;

import java.io.FileNotFoundException;
import java.util.List;
import java.util.Optional;

@Service
public interface DeviceService {
  List<DeviceEntity> findAll();

  DeviceEntity findByClient_Name(String name);

  void save(DeviceEntity deviceEntity);

  Optional<DeviceEntity> findById(Long id);

  void deleteById(Long id);

  void uploadImage(MultipartFile multipartFile, String photoName) throws FileNotFoundException;

    List<DeviceEntity> findAllByClientId(Long id);
}
