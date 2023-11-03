package ru.cardinal.servicecentr.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import ru.cardinal.servicecentr.models.Client;
import ru.cardinal.servicecentr.models.DeviceEntity;

import java.util.List;

@Repository
public interface DeviceRepo extends JpaRepository<DeviceEntity, Long> {
  DeviceEntity findByClient_Name(String name);

  List<DeviceEntity> findAllByClient_Id(Long id);
}
