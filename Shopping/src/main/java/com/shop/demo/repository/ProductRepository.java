package com.shop.demo.repository;

import com.shop.demo.model.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product, Integer> {
    //List
    @Query(value = "select c from Product c where c.status=1 and c.nameProduct like '%' || :key || '%' ")
    Page<Product> search(@Param("key") String key, Pageable page);

    @Query(value = "select c from Product c where c.status=1 and c.category.id = :id")
    Page<Product> searchByCategory(@Param("id") Integer id, Pageable page);

    @Query(value = "select c from Product c where c.status=1 and c.producer.id=:id")
    Page<Product> searchByProducer(@Param("id") Integer id, Pageable page);

    @Query(value = "select c from  Product c where c.status=1 and  c.news=1")
    Page<Product> searchByNews(Pageable page);

    @Query(value = "select c from Product  c where  c.status=1 and  c.discount > 0 order by c.discount desc ")
    Page<Product> searchBySales(Pageable page);

    @Query(value = "select  c from  Product  c where  c.status=1 and  c.views>=0 order by c.views desc ")
    Page<Product> searchByViews(Pageable page);

    @Query(value = "select c from  Product  c where  c.status=1 and  c.special=1")
    Page<Product> searchBySpecial(Pageable page);

    @Query(value = "select c from  Product  c where  c.status=1 and  c.discount > 0 order by c.productDate desc ")
    Page<Product> searchBySaleNews(Pageable page);

    @Query(value = "select c from Product c where c.status=1 and size(c.orderDetail)>1")
    Page<Product> searchByBuy(Pageable page);

    //Employee
    @Query(value = "select c from  Product c where c.status like '%' || :key || '%' ")
    List<Product> searchByStatus(@Param("key") String key);

    //search by 3
    @Query(value = "select c from Product c where  c.nameProduct like '%' || :key || '%' " +
            " and c.category.id like :DM " +
            " and c.producer.id like :HSX ")
    List<Product> searchByAll(String key, @Param("DM") Integer DM, @Param("HSX") Integer HSX);

    //search by key
    @Query(value = "select c from Product c where  c.nameProduct like '%' || :key || '%'")
    List<Product> searchByKey(String key);

    //search by category and producer
    @Query(value = "select c from Product c where c.category.id like :DM and c.producer.id like :HSX")
    List<Product> searchBy2(Integer DM, Integer HSX);

    //search By Category
    @Query(value = "select c from Product c where c.category.id like :DM")
    List<Product> searchByCate(Integer DM);

    //search By producer
    @Query(value = "select c from Product c where c.producer.id like :HSX")
    List<Product> searchByPro(Integer HSX);

    //Key with cate
    @Query(value = "select c from Product c where c.nameProduct like '%' || :key ||  '%' or c.category.id like :DM")
    List<Product> searchByNameAndCate(String key, Integer DM);

    //Key with pro
    @Query(value = "select c from Product c where c.nameProduct like '%' || :key || '%' or c.producer.id  like :HSX")
    List<Product> searchByNameAndPro(String key, Integer HSX);

    //Inventory Manager
    @Query(value = "select SUM(p.unitPrice) from Product as p , Category as c group by p.category.id")
    List<Product> ProductInventory();

    //Total Category
    @Query(value = "select p.category.nameCategory,SUM(p.quantity), SUM(p.quantity*p.unitPrice), MIN(p.unitPrice),MAX(p.unitPrice), " +
            "AVG(p.unitPrice) FROM Product p  GROUP BY p.category.nameCategory")
    Page<Product> findTotalSumProduct(Pageable pageable);

    //Total Producer
    @Query(value = "select p.producer.nameProducer ,sum(p.quantity) , sum(p.quantity*p.unitPrice),min(p.unitPrice),max(p.unitPrice), " +
            " avg(p.unitPrice) from Product  p group by  p.producer.nameProducer")
    Page<Product> findTotalSumProducer(Pageable pageable);

    //Total 2
    @Query(value = "select p.producer.nameProducer, p.category.nameCategory ,sum(p.quantity),sum(p.quantity*p.unitPrice),min(p.unitPrice),max(p.unitPrice), " +
            "avg(p.unitPrice) from Product p group by p.producer.nameProducer,p.category.nameCategory")
    Page<Product> findTotal2(Pageable page);


    @Query(value = "select p.producer.nameProducer, p.category.nameCategory ,sum(p.quantity),sum(p.quantity*p.unitPrice),min(p.unitPrice),max(p.unitPrice), " +
            "avg(p.unitPrice) from Product p group by p.producer.nameProducer,p.category.nameCategory")
    List<Product> findTotalByCategoryByProducer();

}
