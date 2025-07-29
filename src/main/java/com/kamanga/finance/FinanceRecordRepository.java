package com.kamanga.finance;

import org.springframework.data.jpa.repository.JpaRepository;

public interface FinanceRecordRepository extends JpaRepository<FinanceRecord, Long> {
} 