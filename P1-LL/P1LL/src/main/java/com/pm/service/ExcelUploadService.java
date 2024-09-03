package com.pm.service;

import java.util.List;

import com.pm.model.ExcelUpload;

public interface ExcelUploadService {

	List<ExcelUpload> getExcelDataAsList();

	int saveExcelData(List<ExcelUpload> excelUpload);

}
