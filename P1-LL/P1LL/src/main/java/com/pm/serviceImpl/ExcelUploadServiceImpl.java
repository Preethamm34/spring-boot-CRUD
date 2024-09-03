package com.pm.serviceImpl;

import java.io.IOException;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.swing.text.DateFormatter;

import org.apache.poi.EncryptedDocumentException;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;

import com.pm.model.ExcelUpload;
import com.pm.repository.ExcelUploadRepository;
import com.pm.service.ExcelUploadService;

public class ExcelUploadServiceImpl implements ExcelUploadService {

	@Value("${app.upload.file:${user.home}}")
	public String EXCEL_FILE_PATH;
	
	Workbook workbook;
	
	@Autowired
	ExcelUploadRepository repo;
	
	@Override
	public List<ExcelUpload> getExcelDataAsList() {
		List<String> list = new ArrayList<String>();
		DateFormatter dateFormatter = new DateFormatter();
		
		try {
			workbook = WorkbookFactory.create(new File(EXCEL_FILE_PATH));
		} catch (EncryptedDocumentException | IOException e) {
			e.printStackTrace();
		}

		// Retrieving the number of sheets in the Workbook
		System.out.println("-------Workbook has '" + workbook.getNumberOfSheets() + "' Sheets-----");

		// Getting the Sheet at index zero
		Sheet sheet = workbook.getSheetAt(0);

		// Getting number of columns in the Sheet
		int noOfColumns = sheet.getRow(0).getLastCellNum();
		System.out.println("-------Sheet has '"+noOfColumns+"' columns------");

		// Using for-each loop to iterate over the rows and columns
		for (Row row : sheet) {
			for (Cell cell : row) {
				String cellValue = dateFormatter.formatCellValue(cell);
				list.add(cellValue);
			}
		}

		// filling excel data and creating list as List<Invoice>
		List<ExcelUpload> excelUpload = createList(list, noOfColumns);

		// Closing the workbook
		try {
			workbook.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return excelUpload;
	}

	@Override
	public int saveExcelData(List<ExcelUpload> excelUpload) {
		// TODO Auto-generated method stub
		return 0;
	}

}
