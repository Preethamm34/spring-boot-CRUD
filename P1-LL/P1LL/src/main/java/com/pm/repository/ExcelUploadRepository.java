package com.pm.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.pm.model.ExcelUpload;

public interface ExcelUploadRepository extends  JpaRepository<ExcelUpload, Long> {

}
