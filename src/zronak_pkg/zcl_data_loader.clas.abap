CLASS zcl_data_loader DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES : if_oo_adt_classrun.
  METHODS insert_data_zproduct_detail.
  METHODS insert_data_zcustomer_detail.
  METHODS insert_data_zorder_hdr_det.
  METHODS insert_data_zorder_item_det.
  DATA : out TYPE REF TO if_oo_adt_classrun_out.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_data_loader IMPLEMENTATION.
  METHOD insert_data_zproduct_detail.
     data: lv_zproduct_detail TYPE ZPRODUCT_DETAIL.


      lv_zproduct_detail-prod_id = '1'.
      lv_zproduct_detail-product_name = 'Laptop' .
     INSERT INTO ZPRODUCT_DETAIL VALUES @lv_zproduct_detail.

           lv_zproduct_detail-prod_id = '2'.
      lv_zproduct_detail-product_name = 'Mouse' .
     INSERT INTO ZPRODUCT_DETAIL VALUES @lv_zproduct_detail.

           lv_zproduct_detail-prod_id = '3'.
      lv_zproduct_detail-product_name = 'Keyboard' .
     INSERT INTO ZPRODUCT_DETAIL VALUES @lv_zproduct_detail.

           lv_zproduct_detail-prod_id = '4'.
      lv_zproduct_detail-product_name = 'Speaker' .
     INSERT INTO ZPRODUCT_DETAIL VALUES @lv_zproduct_detail.

           lv_zproduct_detail-prod_id = '5'.
      lv_zproduct_detail-product_name = 'Mobile' .
     INSERT INTO ZPRODUCT_DETAIL VALUES @lv_zproduct_detail.

     SELECT * FROM ZPRODUCT_DETAIL INTO TABLE @DATA(lt_zproduct_detail).

     out->write( lt_zproduct_detail ).

  ENDMETHOD.

  METHOD if_oo_adt_classrun~main.
     me->out = out.
     insert_data_zorder_item_det( ).


  ENDMETHOD.

  METHOD insert_data_zcustomer_detail.

   data: lv_zcustomer_detail TYPE zcustomer_detail.

          lv_zcustomer_detail-cust_id = '1'.
          lv_zcustomer_detail-cust_name = 'A'.
               INSERT INTO zcustomer_detail VALUES @lv_zcustomer_detail.

                       lv_zcustomer_detail-cust_id = '2'.
          lv_zcustomer_detail-cust_name = 'B'.
               INSERT INTO zcustomer_detail VALUES @lv_zcustomer_detail.

                       lv_zcustomer_detail-cust_id = '3'.
          lv_zcustomer_detail-cust_name = 'C'.
               INSERT INTO zcustomer_detail VALUES @lv_zcustomer_detail.

                       lv_zcustomer_detail-cust_id = '4'.
          lv_zcustomer_detail-cust_name = 'D'.
               INSERT INTO zcustomer_detail VALUES @lv_zcustomer_detail.

                       lv_zcustomer_detail-cust_id = '5'.
          lv_zcustomer_detail-cust_name = 'E'.
               INSERT INTO zcustomer_detail VALUES @lv_zcustomer_detail.

                       lv_zcustomer_detail-cust_id = '6'.
          lv_zcustomer_detail-cust_name = 'F'.
               INSERT INTO zcustomer_detail VALUES @lv_zcustomer_detail.

                    SELECT * FROM zcustomer_detail INTO TABLE @DATA(lt_zcustomer_detail).

     out->write( lt_zcustomer_detail ).


  ENDMETHOD.

  METHOD insert_data_zorder_hdr_det.
  DATA: lv_zorder_hdr_det TYPE zorder_hdr_det.
        lv_zorder_hdr_det-order_id  = '1'.
        lv_zorder_hdr_det-created_on  = '12122021'.
        lv_zorder_hdr_det-created_by  = 'Ronak Pandit'.
        lv_zorder_hdr_det-cust_id  = '6'.
        lv_zorder_hdr_det-amount  = '50000.23'.
        lv_zorder_hdr_det-currency  = 'INR'.
        lv_zorder_hdr_det-text  = 'Order1'.

  INSERT INTO zorder_hdr_det VALUES @lv_zorder_hdr_det.

        lv_zorder_hdr_det-order_id  = '2'.
        lv_zorder_hdr_det-created_on  = '12122021'.
        lv_zorder_hdr_det-created_by  = 'Ronak Pandit'.
        lv_zorder_hdr_det-cust_id  = '4'.
        lv_zorder_hdr_det-amount  = '150000.23'.
        lv_zorder_hdr_det-currency  = 'INR'.
        lv_zorder_hdr_det-text  = 'Order2'.

  INSERT INTO zorder_hdr_det VALUES @lv_zorder_hdr_det.


        lv_zorder_hdr_det-order_id  = '3'.
        lv_zorder_hdr_det-created_on  = '12122021'.
        lv_zorder_hdr_det-created_by  = 'Ronak Pandit'.
        lv_zorder_hdr_det-cust_id  = '5'.
        lv_zorder_hdr_det-amount  = '24500.23'.
        lv_zorder_hdr_det-currency  = 'INR'.
        lv_zorder_hdr_det-text  = 'Order3'.

  INSERT INTO zorder_hdr_det VALUES @lv_zorder_hdr_det.



        lv_zorder_hdr_det-order_id  = '4'.
        lv_zorder_hdr_det-created_on  = '12122021'.
        lv_zorder_hdr_det-created_by  = 'Ronak Pandit'.
        lv_zorder_hdr_det-cust_id  = '1'.
        lv_zorder_hdr_det-amount  = '1290.00'.
        lv_zorder_hdr_det-currency  = 'INR'.
        lv_zorder_hdr_det-text  = 'Order4'.

  INSERT INTO zorder_hdr_det VALUES @lv_zorder_hdr_det.



        lv_zorder_hdr_det-order_id  = '5'.
        lv_zorder_hdr_det-created_on  = '12122021'.
        lv_zorder_hdr_det-created_by  = 'Ronak Pandit'.
        lv_zorder_hdr_det-cust_id  = '3'.
        lv_zorder_hdr_det-amount  = '2098.00'.
        lv_zorder_hdr_det-currency  = 'INR'.
        lv_zorder_hdr_det-text  = 'Order5'.

  INSERT INTO zorder_hdr_det VALUES @lv_zorder_hdr_det.


        lv_zorder_hdr_det-order_id  = '6'.
        lv_zorder_hdr_det-created_on  = '12122021'.
        lv_zorder_hdr_det-created_by  = 'Ronak Pandit'.
        lv_zorder_hdr_det-cust_id  = '5'.
        lv_zorder_hdr_det-amount  = '1290.98'.
        lv_zorder_hdr_det-currency  = 'INR'.
        lv_zorder_hdr_det-text  = 'Order6'.

  INSERT INTO zorder_hdr_det VALUES @lv_zorder_hdr_det.


        lv_zorder_hdr_det-order_id  = '7'.
        lv_zorder_hdr_det-created_on  = '12122021'.
        lv_zorder_hdr_det-created_by  = 'Ronak Pandit'.
        lv_zorder_hdr_det-cust_id  = '5'.
        lv_zorder_hdr_det-amount  = '2345.23'.
        lv_zorder_hdr_det-currency  = 'INR'.
        lv_zorder_hdr_det-text  = 'Order7'.

  INSERT INTO zorder_hdr_det VALUES @lv_zorder_hdr_det.


        lv_zorder_hdr_det-order_id  = '8'.
        lv_zorder_hdr_det-created_on  = '12122021'.
        lv_zorder_hdr_det-created_by  = 'Ronak Pandit'.
        lv_zorder_hdr_det-cust_id  = '3'.
        lv_zorder_hdr_det-amount  = '2098.23'.
        lv_zorder_hdr_det-currency  = 'INR'.
        lv_zorder_hdr_det-text  = 'Order8'.

  INSERT INTO zorder_hdr_det VALUES @lv_zorder_hdr_det.

        lv_zorder_hdr_det-order_id  = '9'.
        lv_zorder_hdr_det-created_on  = '12122021'.
        lv_zorder_hdr_det-created_by  = 'Ronak Pandit'.
        lv_zorder_hdr_det-cust_id  = '2'.
        lv_zorder_hdr_det-amount  = '1234.23'.
        lv_zorder_hdr_det-currency  = 'INR'.
        lv_zorder_hdr_det-text  = 'Order9'.

  INSERT INTO zorder_hdr_det VALUES @lv_zorder_hdr_det.

  SELECT * FROM zorder_hdr_det INTO TABLE @DATA(lt_zorder_hdr_det).

  out->write( lt_zorder_hdr_det ).

  ENDMETHOD.

  METHOD insert_data_zorder_item_det.

  DATA: lv_zorder_item_det TYPE zorder_item_det.

        lv_zorder_item_det-order_id = '1'.
        lv_zorder_item_det-item_id = '1'.
        lv_zorder_item_det-prod_id = '4'.
        lv_zorder_item_det-quantity = '3'.
        lv_zorder_item_det-unit = 'EA'.
        lv_zorder_item_det-amount = '2098.65'.
        lv_zorder_item_det-currency = 'INR'.
        lv_zorder_item_det-status = 'A'.
         INSERT INTO zorder_item_det VALUES @lv_zorder_item_det.

             lv_zorder_item_det-order_id = '1'.
        lv_zorder_item_det-item_id = '2'.
        lv_zorder_item_det-prod_id = '1'.
        lv_zorder_item_det-quantity = '2'.
        lv_zorder_item_det-unit = 'EA'.
        lv_zorder_item_det-amount = '8765.00'.
        lv_zorder_item_det-currency = 'INR'.
        lv_zorder_item_det-status = 'B'.
          INSERT INTO zorder_item_det VALUES @lv_zorder_item_det.

                   lv_zorder_item_det-order_id = '2'.
        lv_zorder_item_det-item_id = '1'.
        lv_zorder_item_det-prod_id = '3'.
        lv_zorder_item_det-quantity = '6'.
        lv_zorder_item_det-unit = 'EA'.
        lv_zorder_item_det-amount = '12345.00'.
        lv_zorder_item_det-currency = 'INR'.
        lv_zorder_item_det-status = 'C'.
          INSERT INTO zorder_item_det VALUES @lv_zorder_item_det.

                   lv_zorder_item_det-order_id = '3'.
        lv_zorder_item_det-item_id = '1'.
        lv_zorder_item_det-prod_id = '1'.
        lv_zorder_item_det-quantity = '8'.
        lv_zorder_item_det-unit = 'EA'.
        lv_zorder_item_det-amount = '40000.00'.
        lv_zorder_item_det-currency = 'INR'.
        lv_zorder_item_det-status = 'C'.
          INSERT INTO zorder_item_det VALUES @lv_zorder_item_det.

                            lv_zorder_item_det-order_id = '4'.
        lv_zorder_item_det-item_id = '1'.
        lv_zorder_item_det-prod_id = '4'.
        lv_zorder_item_det-quantity = '2'.
        lv_zorder_item_det-unit = 'EA'.
        lv_zorder_item_det-amount = '20000.00'.
        lv_zorder_item_det-currency = 'INR'.
        lv_zorder_item_det-status = 'C'.
          INSERT INTO zorder_item_det VALUES @lv_zorder_item_det.


                            lv_zorder_item_det-order_id = '4'.
        lv_zorder_item_det-item_id = '2'.
        lv_zorder_item_det-prod_id = '5'.
        lv_zorder_item_det-quantity = '18'.
        lv_zorder_item_det-unit = 'EA'.
        lv_zorder_item_det-amount = '20000.00'.
        lv_zorder_item_det-currency = 'INR'.
        lv_zorder_item_det-status = 'C'.
          INSERT INTO zorder_item_det VALUES @lv_zorder_item_det.


                            lv_zorder_item_det-order_id = '5'.
        lv_zorder_item_det-item_id = '1'.
        lv_zorder_item_det-prod_id = '1'.
        lv_zorder_item_det-quantity = '9'.
        lv_zorder_item_det-unit = 'EA'.
        lv_zorder_item_det-amount = '90000.00'.
        lv_zorder_item_det-currency = 'INR'.
        lv_zorder_item_det-status = 'C'.
          INSERT INTO zorder_item_det VALUES @lv_zorder_item_det.



                            lv_zorder_item_det-order_id = '6'.
        lv_zorder_item_det-item_id = '1'.
        lv_zorder_item_det-prod_id = '1'.
        lv_zorder_item_det-quantity = '18'.
        lv_zorder_item_det-unit = 'EA'.
        lv_zorder_item_det-amount = '40000.00'.
        lv_zorder_item_det-currency = 'INR'.
        lv_zorder_item_det-status = 'C'.
          INSERT INTO zorder_item_det VALUES @lv_zorder_item_det.

                            lv_zorder_item_det-order_id = '4'.
        lv_zorder_item_det-item_id = '3'.
        lv_zorder_item_det-prod_id = '1'.
        lv_zorder_item_det-quantity = '8'.
        lv_zorder_item_det-unit = 'EA'.
        lv_zorder_item_det-amount = '40000.00'.
        lv_zorder_item_det-currency = 'INR'.
        lv_zorder_item_det-status = 'C'.
          INSERT INTO zorder_item_det VALUES @lv_zorder_item_det.




    SELECT * FROM zorder_hdr_det INTO TABLE @DATA(lt_zorder_item_det).

  out->write( lt_zorder_item_det ).

  ENDMETHOD.

ENDCLASS.
