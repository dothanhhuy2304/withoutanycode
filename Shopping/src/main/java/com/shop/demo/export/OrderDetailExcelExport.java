package com.shop.demo.export;

import com.shop.demo.model.OrderDetail;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;

public class OrderDetailExcelExport {

    private XSSFWorkbook workbook;

    private XSSFSheet sheet;

    private List<OrderDetail> orderDetailList;

    public OrderDetailExcelExport(List<OrderDetail> orderDetailList) {
        workbook = new XSSFWorkbook();
        sheet = workbook.createSheet("OrderDetail");
        this.orderDetailList = orderDetailList;
    }

    public void writeTitleRow() {
        Font titleFont = workbook.createFont();
        titleFont.setBold(true);
        titleFont.setFontHeightInPoints((short) 19);
        titleFont.setColor(IndexedColors.RED1.getIndex());
        CellStyle titleCellStyle = workbook.createCellStyle();
        titleCellStyle.setFont(titleFont);

        Row row = sheet.createRow(0);
        Cell cell = row.createCell(5);
        cell.setCellValue("Danh Sách Đơn Hàng");
        cell.setCellStyle(titleCellStyle);
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
        cell.setCellValue("Mã đơn hàng");
        cell.setCellStyle(headerCellStyle);

        cell = row.createCell(1);
        cell.setCellValue("Tên khách hàng");
        cell.setCellStyle(headerCellStyle);

        cell = row.createCell(2);
        cell.setCellValue("Tên sản phẩm");
        cell.setCellStyle(headerCellStyle);

        cell = row.createCell(3);
        cell.setCellValue("Ngày đặt hàng");
        cell.setCellStyle(headerCellStyle);

        cell = row.createCell(4);
        cell.setCellValue("Ngày nhận hàng");
        cell.setCellStyle(headerCellStyle);

        cell = row.createCell(5);
        cell.setCellValue("Đơn Giá");
        cell.setCellStyle(headerCellStyle);

        cell = row.createCell(6);
        cell.setCellValue("Số Lượng");
        cell.setCellStyle(headerCellStyle);

        cell = row.createCell(7);
        cell.setCellValue("Giảm Giá");
        cell.setCellStyle(headerCellStyle);

        cell = row.createCell(8);
        cell.setCellValue("Số Tiền");
        cell.setCellStyle(headerCellStyle);

        cell = row.createCell(9);
        cell.setCellValue("Địa Chỉ");
        cell.setCellStyle(headerCellStyle);

        cell = row.createCell(10);
        cell.setCellValue("Người Nhận");
        cell.setCellStyle(headerCellStyle);

        cell = row.createCell(11);
        cell.setCellValue("Trạng Thái Đơn Hàng");
        cell.setCellStyle(headerCellStyle);
    }

    public void writeDataRow() {
        Font dataFont = workbook.createFont();
        dataFont.setBold(false);
        dataFont.setColor(IndexedColors.BLUE.getIndex());
        CellStyle dataCellStyle = workbook.createCellStyle();
        dataCellStyle.setFont(dataFont);

        int countData = 2;
        for (OrderDetail orderDetail : orderDetailList) {
            Row row = sheet.createRow(countData++);
            Cell cell = row.createCell(0);
            cell.setCellValue(orderDetail.getOrder().getId());
            cell.setCellStyle(dataCellStyle);

            cell = row.createCell(1);
            cell.setCellValue(orderDetail.getOrder().getCustomer().getFullName());
            cell.setCellStyle(dataCellStyle);

            cell = row.createCell(2);
            cell.setCellValue(orderDetail.getProduct().getNameProduct());
            cell.setCellStyle(dataCellStyle);

            DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
            String currentDatetime = dateFormat.format(orderDetail.getOrder().getOrderDate());
            cell = row.createCell(3);
            cell.setCellValue(currentDatetime);
            cell.setCellStyle(dataCellStyle);

            DateFormat requireDate = new SimpleDateFormat("dd/MM/yyyy");
            String getRequireDate = requireDate.format(orderDetail.getOrder().getRequireDate());
            cell = row.createCell(4);
            cell.setCellValue(getRequireDate);
            cell.setCellStyle(dataCellStyle);

            cell = row.createCell(5);
            cell.setCellValue(orderDetail.getAmount());
            cell.setCellStyle(dataCellStyle);

            cell = row.createCell(6);
            cell.setCellValue(orderDetail.getQuantity());
            cell.setCellStyle(dataCellStyle);

            cell = row.createCell(7);
            cell.setCellValue((100 * orderDetail.getDiscount()) + "%");
            cell.setCellStyle(dataCellStyle);

            cell = row.createCell(8);
            cell.setCellValue(orderDetail.getOrder().getAmount());
            cell.setCellStyle(dataCellStyle);

            cell = row.createCell(9);
            cell.setCellValue(orderDetail.getOrder().getAddress());
            cell.setCellStyle(dataCellStyle);

            cell = row.createCell(10);
            cell.setCellValue(orderDetail.getOrder().getReceiver());
            cell.setCellStyle(dataCellStyle);

            cell = row.createCell(11);
            if (orderDetail.getOrder().getStatus() == 1) {
                cell.setCellValue("Mới Đặt Hàng");
                cell.setCellStyle(dataCellStyle);
            } else if (orderDetail.getOrder().getStatus() == 2) {
                cell.setCellValue("Đã Hủy");
                cell.setCellStyle(dataCellStyle);
            } else if (orderDetail.getOrder().getStatus() == 3) {
                cell.setCellValue("Đã Xác Nhận");
                cell.setCellStyle(dataCellStyle);
            } else if (orderDetail.getOrder().getStatus() == 4) {
                cell.setCellValue("Đã Nhận");
                cell.setCellStyle(dataCellStyle);
            } else {
                cell.setCellValue(orderDetail.getOrder().getStatus());
                cell.setCellStyle(dataCellStyle);
            }
        }
    }

    public void export(HttpServletResponse response) throws IOException {
        writeTitleRow();
        writeHeaderRow();
        writeDataRow();
        OutputStream outputStream = response.getOutputStream();
        workbook.write(outputStream);
        workbook.close();
        outputStream.close();
    }
}
