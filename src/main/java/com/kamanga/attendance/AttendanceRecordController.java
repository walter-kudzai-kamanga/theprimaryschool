package com.kamanga.attendance;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/attendance")
public class AttendanceRecordController {
    @Autowired
    private AttendanceRecordRepository attendanceRecordRepository;

    @GetMapping
    public List<AttendanceRecord> getAllAttendanceRecords() {
        return attendanceRecordRepository.findAll();
    }

    @PostMapping
    public AttendanceRecord createAttendanceRecord(@RequestBody AttendanceRecord record) {
        return attendanceRecordRepository.save(record);
    }

    @GetMapping("/{id}")
    public AttendanceRecord getAttendanceRecordById(@PathVariable Long id) {
        return attendanceRecordRepository.findById(id).orElse(null);
    }

    @PutMapping("/{id}")
    public AttendanceRecord updateAttendanceRecord(@PathVariable Long id, @RequestBody AttendanceRecord recordDetails) {
        AttendanceRecord record = attendanceRecordRepository.findById(id).orElse(null);
        if (record != null) {
            record.setStudent(recordDetails.getStudent());
            record.setDate(recordDetails.getDate());
            record.setPresent(recordDetails.isPresent());
            return attendanceRecordRepository.save(record);
        }
        return null;
    }

    @DeleteMapping("/{id}")
    public void deleteAttendanceRecord(@PathVariable Long id) {
        attendanceRecordRepository.deleteById(id);
    }
    
    @GetMapping("/student/{studentId}")
    public List<AttendanceRecord> getAttendanceByStudent(@PathVariable Long studentId) {
        return attendanceRecordRepository.findByStudentId(studentId);
    }
} 