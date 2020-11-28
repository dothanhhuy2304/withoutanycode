package com.shop.demo.export;

import com.shop.demo.model.Product;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class ProductExcelExport {

    private XSSFWorkbook workbook;
    private XSSFSheet sheet;
    private List<Product> productList;

    public ProductExcelExport(List<Product> productList) {
        workbook = new XSSFWorkbook();
        sheet = workbook.createSheet("Product");
        this.productList = productList;
    }

    public void writeTitleRow() {
        Font headerFont = workbook.createFont();
        headerFont.setBold(true);
        headerFont.setFontHeightInPoints((short) 19);
        headerFont.setColor(IndexedColors.RED1.getIndex());
        CellStyle headerCellStyle = workbook.createCellStyle();
        headerCellStyle.setFont(headerFont);

        Row row = sheet.createRow(0);
        Cell cell = row.createCell(6);
        cell.setCellValue("Danh Sách Sản Phẩm");
        cell.setCellStyle(headerCellStyle);
    }

    public void writeHeaderRow() {
        Font headerFont = workbook.createFont();
        headerFont.setBold(true);
        headerFont.setFontHeightInPoints((short) 14);
        headerFont.setColor(IndexedColors.RED.getIndex());
        CellStyle headerCellStyle = workbook.createCellStyle();
        headerCellStyle.setFont(headerFont);

        Row row = sheet.createRow(1);
        Cell cell = row.createCell(0);
        cell.setCellValue("Mã Sản Phẩm");
        cell.setCellStyle(headerCellStyle);

        cell = row.createCell(1);
        cell.setCellValue("Tên Sản Phẩm");
        cell.setCellStyle(headerCellStyle);

        cell = row.createCell(2);
        cell.setCellValue("Nhà Cung Cấp");
        cell.setCellStyle(headerCellStyle);

        cell = row.createCell(3);
        cell.setCellValue("Danh Mục");
        cell.setCellStyle(headerCellStyle);

        cell = row.createCell(4);
        cell.setCellValue("Đơn Giá");
        cell.setCellStyle(headerCellStyle);

        cell = row.createCell(5);
        cell.setCellValue("Số Lượng");
        cell.setCellStyle(headerCellStyle);

        cell = row.createCell(6);
        cell.setCellValue("Đơn Vị Tính");
        cell.setCellStyle(headerCellStyle);

        cell = row.createCell(7);
        cell.setCellValue("Giảm Giá");
        cell.setCellStyle(headerCellStyle);

        cell = row.createCell(8);
        cell.setCellValue("Ngày Sản Suất");
        cell.setCellStyle(headerCellStyle);

        cell = row.createCell(9);
        cell.setCellValue("Hàng Mới");
        cell.setCellStyle(headerCellStyle);

        cell = row.createCell(10);
        cell.setCellValue("Hàng Đặc Biệt");
        cell.setCellStyle(headerCellStyle);

        cell = row.createCell(11);
        cell.setCellValue("Có Sẵn");
        cell.setCellStyle(headerCellStyle);

        cell = row.createCell(12);
        cell.setCellValue("Trạng Thái");
        cell.setCellStyle(headerCellStyle);
    }

    public void writeDataRow() {
        Font dataFont = workbook.createFont();
        dataFont.setColor(IndexedColors.BLUE.getIndex());
        CellStyle dataCellStyle = workbook.createCellStyle();
        dataCellStyle.setFont(dataFont);

        int countData = 2;
        for (Product product : productList) {
            Row row = sheet.createRow(countData++);
            Cell cell = row.createCell(0);
            cell.setCellValue(product.getId());
            cell.setCellStyle(dataCellStyle);

            cell = row.createCell(1);
            cell.setCellValue(product.getNameProduct());
            cell.setCellStyle(dataCellStyle);

            cell = row.createCell(2);
            cell.setCellValue(product.getProducer().getNameProducer());
            cell.setCellStyle(dataCellStyle);

            cell = row.createCell(3);
            cell.setCellValue(product.getCategory().getNameCategory());
            cell.setCellStyle(dataCellStyle);

            cell = row.createCell(4);
            cell.setCellValue(product.getUnitPrice());
            cell.setCellStyle(dataCellStyle);

            cell = row.createCell(5);
            cell.setCellValue(product.getQuantity());
            cell.setCellStyle(dataCellStyle);

            cell = row.createCell(6);
            cell.setCellValue(product.getUnitBrief());
            cell.setCellStyle(dataCellStyle);

            cell = row.createCell(7);
            cell.setCellValue(product.getDiscount() * 100 + "%");
            cell.setCellStyle(dataCellStyle);

            cell = row.createCell(8);
            cell.setCellValue(product.getProductDate().toString());
            cell.setCellStyle(dataCellStyle);

            cell = row.createCell(9);
            if (product.getNews()) {
                cell.setCellValue("Hàng Mới");
                cell.setCellStyle(dataCellStyle);
            } else if (!product.getNews()) {
                cell.setCellValue("Không");
                cell.setCellStyle(dataCellStyle);
            }

            cell = row.createCell(10);
            if (product.getSpecial()) {
                cell.setCellValue("Hàng đặc biệt");
                cell.setCellStyle(dataCellStyle);
            } else if (!product.getSpecial()) {
                cell.setCellValue("Không");
                cell.setCellStyle(dataCellStyle);
            }

            cell = row.createCell(11);
            if (product.getAvailable()) {
                cell.setCellValue("Hàng có sẵn");
                cell.setCellStyle(dataCellStyle);
            } else if (!product.getAvailable()) {
                cell.setCellValue("Không");
                cell.setCellStyle(dataCellStyle);
            }

            cell = row.createCell(12);
            if (product.getStatus()) {
                cell.setCellValue("Đã Duyệt");
                cell.setCellStyle(dataCellStyle);
            } else if (!product.getStatus()) {
                cell.setCellValue("Không");
                cell.setCellStyle(dataCellStyle);
            }
        }
    }

    public void export(HttpServletResponse response) throws IOException {
        writeTitleRow();
        writeHeaderRow();
        writeDataRow();
        ServletOutputStream outputStream = response.getOutputStream();
        workbook.write(outputStream);
        workbook.close();
        outputStream.close();
    }

    {
    }

}
