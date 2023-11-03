package ru.cardinal.servicecentr.services;

import org.springframework.stereotype.Service;
import ru.cardinal.servicecentr.models.CategoryEntity;
import ru.cardinal.servicecentr.models.DeviceEntity;

import java.util.List;

@Service
public interface CategoryService {
    boolean save(CategoryEntity category);

    List<CategoryEntity> findAll();

    CategoryEntity findById(Long id);

    void deleteById(Long id);

    List<DeviceEntity> findAllByCategoryId(Long id);
}
