package ru.cardinal.servicecentr.controllers.rest;

import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import ru.cardinal.servicecentr.models.DeviceEntity;
import ru.cardinal.servicecentr.services.DeviceService;

@RestController
@RequestMapping("/api/v1/device")
@RequiredArgsConstructor
public class DeviceControllerRest {
    private final DeviceService deviceService;
    @PostMapping
    public ResponseEntity<?> addDevice(@RequestBody DeviceEntity deviceEntity) {

        deviceService.save(deviceEntity);
        return ResponseEntity.ok().build();
    }


}
