-- Pre BAF
select ccl_id_coil , substr(PCH_PROC_PATH,2,1) ROUTE, ccl_cd_status, ccl_sec1,ccl_sec2,ccl_odia,ccl_ms_piece_actl, TMA_GRADE,ccl_tdc_actl
from v_cold_coil,v_tdc_main,v_proc_chart
where ccl_tdc_actl = tma_tdc_no
and PCH_PROC_CHT_NO = TMA_PROC_CHT_NO
and CCL_CD_PROD = 'C01'
and ccl_cd_status in ('BC','BB','PP','BF','AP')


-- Pre PLTCM
select hrc_id_pc_usrkey ccl_id_coil, substr(PCH_PROC_PATH,2,1) ROUTE, hrc_cd_st_piece ccl_cd_status, HRC_SEC1_PIECE_NO ccl_sec1, HRC_SEC2_PIECE_NO ccl_sec2,
HRC_ODIA_PIECE_NO ccl_odia, HRC_MS_PIECE_ACT ccl_ms_piece_actl,TMA_GRADE,iwi_tdc_no ccl_tdc_actl
from v_hr_coil,v_wo_item,v_tdc_main,v_proc_chart
where hrc_cd_st_piece in ('PB','PC','PF','PJ')
and hrc_id_order = iwi_wo_no
and hrc_id_order_item = iwi_item_no
and tma_tdc_no = iwi_tdc_no
and PCH_PROC_CHT_NO = TMA_PROC_CHT_NO
and iwi_prod_cd = 'C01'

-- Pre ECL
select ccl_id_coil , substr(PCH_PROC_PATH,2,1) ROUTE, ccl_cd_status, ccl_sec1,ccl_sec2,ccl_odia,ccl_ms_piece_actl, TMA_GRADE,ccl_tdc_actl
from v_cold_coil,v_tdc_main,v_proc_chart
where ccl_tdc_actl = tma_tdc_no
and PCH_PROC_CHT_NO = TMA_PROC_CHT_NO
and CCL_CD_PROD = 'C01'
and ccl_cd_status in ('AB','AC','AJ')

-- HR Ready greater than 40 Hr
select hrc_id_pc_usrkey , substr(PCH_PROC_PATH,2,1) ROUTE, hrc_cd_st_piece , HRC_SEC1_PIECE_NO, HRC_SEC2_PIECE_NO ,HRC_ODIA_PIECE_NO, HRC_MS_PIECE_ACT,TMA_GRADE,iwi_tdc_no
from v_hr_coil,v_wo_item,v_tdc_main,v_proc_chart
where hrc_id_order = iwi_wo_no
and hrc_id_order_item = iwi_item_no
and tma_tdc_no = iwi_tdc_no
and PCH_PROC_CHT_NO = TMA_PROC_CHT_NO
and iwi_prod_cd = 'C01'
and (SYSDATE - hrc_dt_piece_crt)*24 > 40
and hrc_cd_st_piece in ('HB','HC')

-- HR Ready <= 40 Hr
select hrc_id_pc_usrkey , substr(PCH_PROC_PATH,2,1) ROUTE, hrc_cd_st_piece , HRC_SEC1_PIECE_NO, HRC_SEC2_PIECE_NO ,HRC_ODIA_PIECE_NO, HRC_MS_PIECE_ACT,TMA_GRADE,iwi_tdc_no
from v_hr_coil,v_wo_item,v_tdc_main,v_proc_chart
where hrc_id_order = iwi_wo_no
and hrc_id_order_item = iwi_item_no
and tma_tdc_no = iwi_tdc_no
and PCH_PROC_CHT_NO = TMA_PROC_CHT_NO
and iwi_prod_cd = 'C01'
and (SYSDATE - hrc_dt_piece_crt)*24 <= 40
and hrc_cd_st_piece in ('HB','HC')


