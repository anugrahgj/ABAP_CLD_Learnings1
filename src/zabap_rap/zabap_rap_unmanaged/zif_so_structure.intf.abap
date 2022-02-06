INTERFACE zif_so_structure
  PUBLIC .

  TYPES: BEGIN OF ts_SO_control,
            vbeln_id  TYPE  ZVBELN_VA_02,
            vbeln  TYPE ABP_BEHV_FLAG,"00 01
            faksk  TYPE ABP_BEHV_FLAG,
            vtweg  TYPE ABP_BEHV_FLAG,
            spart  TYPE ABP_BEHV_FLAG,
            vkorg  TYPE ABP_BEHV_FLAG,
            netwr  TYPE ABP_BEHV_FLAG,
            waerk  TYPE ABP_BEHV_FLAG,
            ernam  TYPE ABP_BEHV_FLAG,
            erdat  TYPE ABP_BEHV_FLAG,

         END OF ts_SO_control.

   TYPES tt_SO_control TYPE TABLE OF ts_SO_control.

*  TYPES: BEGIN OF ty_so_control,
*          vbeln_id TYPE zvbeln_va_02,
*          vbeln TYPE abp_behv_flag,
*          faksk TYPE abp_behv_flag,
*          vtweg TYPE abp_behv_flag,
*          spart TYPE abp_behv_flag,
*          vkorg TYPE abp_behv_flag,
*          netwr TYPE abp_behv_flag,
*          waerk TYPE abp_behv_flag,
*          ernam TYPE abp_behv_flag,
*          erdat TYPE abp_behv_flag,
*
*         END OF ty_so_control.
*
*   TYPES tt_so_control TYPE TABLE OF ty_so_control.

ENDINTERFACE.
