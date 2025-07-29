package com.kamanga.transport;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/transport")
public class TransportRecordController {
    @Autowired
    private TransportRecordRepository transportRecordRepository;

    @GetMapping
    public List<TransportRecord> getAllTransportRecords() {
        return transportRecordRepository.findAll();
    }

    @PostMapping
    public TransportRecord createTransportRecord(@RequestBody TransportRecord record) {
        return transportRecordRepository.save(record);
    }

    @GetMapping("/{id}")
    public TransportRecord getTransportRecordById(@PathVariable Long id) {
        return transportRecordRepository.findById(id).orElse(null);
    }

    @PutMapping("/{id}")
    public TransportRecord updateTransportRecord(@PathVariable Long id, @RequestBody TransportRecord recordDetails) {
        TransportRecord record = transportRecordRepository.findById(id).orElse(null);
        if (record != null) {
            record.setRoute(recordDetails.getRoute());
            record.setDriver(recordDetails.getDriver());
            record.setVehicleNumber(recordDetails.getVehicleNumber());
            return transportRecordRepository.save(record);
        }
        return null;
    }

    @DeleteMapping("/{id}")
    public void deleteTransportRecord(@PathVariable Long id) {
        transportRecordRepository.deleteById(id);
    }
} 