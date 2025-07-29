package com.kamanga.inventory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/inventory")
public class InventoryItemController {
    @Autowired
    private InventoryItemRepository inventoryItemRepository;

    @GetMapping
    public List<InventoryItem> getAllInventoryItems() {
        return inventoryItemRepository.findAll();
    }

    @PostMapping
    public InventoryItem createInventoryItem(@RequestBody InventoryItem item) {
        return inventoryItemRepository.save(item);
    }

    @GetMapping("/{id}")
    public InventoryItem getInventoryItemById(@PathVariable Long id) {
        return inventoryItemRepository.findById(id).orElse(null);
    }

    @PutMapping("/{id}")
    public InventoryItem updateInventoryItem(@PathVariable Long id, @RequestBody InventoryItem itemDetails) {
        InventoryItem item = inventoryItemRepository.findById(id).orElse(null);
        if (item != null) {
            item.setName(itemDetails.getName());
            item.setQuantity(itemDetails.getQuantity());
            item.setLocation(itemDetails.getLocation());
            return inventoryItemRepository.save(item);
        }
        return null;
    }

    @DeleteMapping("/{id}")
    public void deleteInventoryItem(@PathVariable Long id) {
        inventoryItemRepository.deleteById(id);
    }
} 