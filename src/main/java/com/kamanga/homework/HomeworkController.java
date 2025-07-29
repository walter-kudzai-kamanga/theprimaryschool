package com.kamanga.homework;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/homework")
public class HomeworkController {
    @Autowired
    private HomeworkRepository homeworkRepository;

    @GetMapping
    public List<Homework> getAllHomework() {
        return homeworkRepository.findAll();
    }

    @PostMapping
    public Homework createHomework(@RequestBody Homework homework) {
        return homeworkRepository.save(homework);
    }

    @GetMapping("/{id}")
    public Homework getHomeworkById(@PathVariable Long id) {
        return homeworkRepository.findById(id).orElse(null);
    }

    @PutMapping("/{id}")
    public Homework updateHomework(@PathVariable Long id, @RequestBody Homework homeworkDetails) {
        Homework homework = homeworkRepository.findById(id).orElse(null);
        if (homework != null) {
            homework.setTitle(homeworkDetails.getTitle());
            homework.setDescription(homeworkDetails.getDescription());
            homework.setDueDate(homeworkDetails.getDueDate());
            return homeworkRepository.save(homework);
        }
        return null;
    }

    @DeleteMapping("/{id}")
    public void deleteHomework(@PathVariable Long id) {
        homeworkRepository.deleteById(id);
    }
} 