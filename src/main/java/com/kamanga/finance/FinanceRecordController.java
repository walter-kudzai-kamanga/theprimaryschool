package com.kamanga.finance;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/finance")
public class FinanceRecordController {
    @Autowired
    private FinanceRecordRepository financeRecordRepository;

    @GetMapping
    public List<FinanceRecord> getAllFinanceRecords() {
        return financeRecordRepository.findAll();
    }

    @PostMapping
    public FinanceRecord createFinanceRecord(@RequestBody FinanceRecord record) {
        return financeRecordRepository.save(record);
    }

    @GetMapping("/{id}")
    public FinanceRecord getFinanceRecordById(@PathVariable Long id) {
        return financeRecordRepository.findById(id).orElse(null);
    }

    @PutMapping("/{id}")
    public FinanceRecord updateFinanceRecord(@PathVariable Long id, @RequestBody FinanceRecord recordDetails) {
        FinanceRecord record = financeRecordRepository.findById(id).orElse(null);
        if (record != null) {
            record.setDescription(recordDetails.getDescription());
            record.setAmount(recordDetails.getAmount());
            record.setType(recordDetails.getType());
            record.setDate(recordDetails.getDate());
            return financeRecordRepository.save(record);
        }
        return null;
    }

    @DeleteMapping("/{id}")
    public void deleteFinanceRecord(@PathVariable Long id) {
        financeRecordRepository.deleteById(id);
    }
} 