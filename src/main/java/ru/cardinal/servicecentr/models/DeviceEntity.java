package ru.cardinal.servicecentr.models;

import jakarta.annotation.Nonnull;
import jakarta.persistence.*;
import lombok.*;
import ru.cardinal.servicecentr.models.enums.RepairStatus;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(exclude = "id")
@Entity
@Table(name = "device_entity")
public class DeviceEntity {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;
  private String deviceName;
  @ManyToOne(cascade = CascadeType.REFRESH, fetch = FetchType.LAZY)
  private Client client;
  private String description;
  private String trouble;
  @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "device")
  private List<BinaryData> photos = new ArrayList<>();
  @Enumerated(EnumType.STRING)
  private RepairStatus repairStatus;
  private LocalDateTime createdAt;
  private LocalDateTime issueDate;
  @ManyToOne(cascade = CascadeType.PERSIST, fetch = FetchType.LAZY)
  private CategoryEntity category;
  private String filename;

  @PrePersist
  public void setValues() {
    this.createdAt = LocalDateTime.now();
     this.repairStatus = RepairStatus.ACCEPTED_FOR_REPAIR;
  }


  public void addImageToProduct(BinaryData binaryData) {
    binaryData.setDevice(this);
    photos.add(binaryData);
  }
}
