<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../include/header.jsp" %>

<section class="sub_con sub02" id="scene1">
	<div class="title">
        <h2><b>reservation</b></h2>
        <h3>예약종합안내</h3>
        <h4>무창포 이루펜션의 바다의 향기를 느껴보세요.</h4>
        <p class="tit_line"></p>
    </div>
    <div class="sub_txt box">
			<div class="info_box">
        <h3><img src="/resources/img/guide/sst1.gif" alt="객실요금안내"></h3>
          <table width="100%" border="0" cellspacing="1" cellpadding="0" class="wideT num">
            <caption>객실별/시즌별 요금안내</caption>
            <tr>
              <th rowspan="2" scope="col">객실</th>
							<th rowspan="2" scope="col">평형</th>
              <th colspan="2" scope="col">인원</th>
              <th colspan="2" scope="col">비수기</th>
							<th colspan="2" scope="col">준성수기</th>
              <th colspan="3" scope="col">성수기</th>
            </tr>
            <tr>
							<th scope="col">기준</th>
							<th scope="col">최대</th>
              <th scope="col">주중(일~목)</th>
              <th scope="col">주말(금~토,공휴일전날)</th>
							<th scope="col">주중(일~목)</th>
              <th scope="col">주말(금~토,공휴일전날)</th>
              <th scope="col">주중(일~목)</th>
              <th scope="col">주말(금~토,공휴일전날)</th>
            </tr>
                        <tr>
              <th class="lef" scope="row">데이지(복층)</th>
							<td>25</td>
              <td>4 명</td>
							<td>8 명</td>
              <td>120,000원</td>
              <td>150,000원</td>
              <td>140,000원</td>
              <td>170,000원</td>
							<td>250,000원</td>
              <td>250,000원</td>
            </tr>
                        <tr>
              <th class="lef" scope="row">릴리(복층)</th>
							<td>25</td>
              <td>4 명</td>
							<td>8 명</td>
              <td>120,000원</td>
              <td>150,000원</td>
              <td>140,000원</td>
              <td>170,000원</td>
							<td>250,000원</td>
              <td>250,000원</td>
            </tr>
                        <tr>
              <th class="lef" scope="row">아이비</th>
							<td>20</td>
              <td>4 명</td>
							<td>6 명</td>
              <td>100,000원</td>
              <td>130,000원</td>
              <td>120,000원</td>
              <td>150,000원</td>
							<td>220,000원</td>
              <td>220,000원</td>
            </tr>
                        <tr>
              <th class="lef" scope="row">마가렛</th>
							<td>25</td>
              <td>4 명</td>
							<td>8 명</td>
              <td>120,000원</td>
              <td>150,000원</td>
              <td>140,000원</td>
              <td>170,000원</td>
							<td>250,000원</td>
              <td>250,000원</td>
            </tr>
         </table>
				        <p align="center" style="padding:25px 0;"><a href="/reservation/reservation_main"><img src="/resources/img/guide/re_but.gif" /></a></p>
        <h3 style="padding-top:35px;"><img src="/resources/img/guide/sst2.gif" alt="기본숙지사항"></h3>
            
					 <p>&nbsp;&nbsp;</p><p style="line-height: 2;"><span style="font-family: 굴림,gulim; font-size: 12pt;"></span><span style="color: rgb(39, 38, 41); font-family: 굴림, gulim; font-size: 12pt;" 1px;"="" 1em;="" sans-serif;="" geneva,="" tahoma,="" ����,="" dotum,="" gothic",="" "nanum="" kr",="" sans="" noto="">&nbsp;- 당일 내 예약대금의 100% 전액(6시간 이내) 입금 완료하셔야 예약 확정이 이루어집니다. (미입금 시 연락없이 자동 예약 취소)</span><span style="font-family: 굴림, gulim; font-size: 12pt;">&nbsp;</span>&nbsp;</p><p style="line-height: 2;"><span style="font-family: 굴림,gulim; font-size: 12pt;">&nbsp;﻿</span><span style="font-family: 굴림,gulim; font-size: 12pt;">- 입금은 꼭 예약자 이름으로 해 주시고 부득이한 경우 연락 주시기 바랍니다.</span><span style="font-family: 굴림,gulim; font-size: 12pt;">&nbsp;</span>&nbsp;</p><p style="list-style: none; padding: 5px 0px; line-height: 2; letter-spacing: 1px; font-family: 돋움,dotum; font-size: 11pt;"><span style="font-family: 굴림,gulim; font-size: 12pt;">&nbsp;- 예약은 실시간예약이 가능합니다.&nbsp;</span><b style="color: rgb(255, 51, 0); letter-spacing: 1px; font-family:;" sans-serif;="" geneva,="" tahoma,="" ����,="" dotum,="" gothic",="" "nanum="" kr",="" sans="" noto="" 14px;"=""><span style="font-family: 굴림,gulim; font-size: 12pt;">010-8598-4075,&nbsp;</span></b><b style="color: rgb(255, 51, 0);"><span style="font-family: 굴림,gulim; font-size: 12pt;">010-9270-4073</span></b></p><p style="list-style: none; padding: 5px 0px; line-height: 2; letter-spacing: 1px; font-family: 돋움,dotum; font-size: 11pt;"><span style="font-family: 굴림,gulim; font-size: 12pt;">&nbsp;- 계좌번호 :&nbsp;</span><b style="color: rgb(255, 51, 0);"><span style="font-family: 굴림,gulim; font-size: 12pt;">농협(염인선) 203027-51-050385</span></b>&nbsp;</p><p style="list-style: none; padding: 5px 0px; line-height: 2; letter-spacing: 1px; font-family: 돋움,dotum; font-size: 11pt;"><span style="font-family: 굴림,gulim; font-size: 12pt;">&nbsp;- 동절기의 경우 난방으로 인해 당일 예약이 어렵습니다.</span> </p><p style="list-style: none; padding: 5px 0px; line-height: 2; letter-spacing: 1px; font-family: 돋움,dotum; font-size: 11pt;"><span style="font-family: 굴림,gulim; font-size: 12pt;">&nbsp;-&nbsp;</span><b style="color: rgb(255, 51, 0);"><span style="font-family: 굴림,gulim; font-size: 12pt;">준성수기기간: 7월 1일&nbsp;~ 7월 14일, 8월 16일 ~ 8월 31일</span></b><span style="font-family: 굴림,gulim;">&nbsp;</span></p><p style="list-style: none; padding: 5px 0px; line-height: 2; letter-spacing: 1px; font-family: 돋움,dotum; font-size: 11pt;"><b style="color: rgb(255, 51, 0);"><span style="font-family: 굴림,gulim; font-size: 12pt;">&nbsp;﻿</span></b><span style="font-family: 굴림,gulim; font-size: 12pt;">-&nbsp;</span><b style="color: rgb(255, 51, 0);"><span style="font-family: 굴림,gulim; font-size: 12pt;">성수기기간: 7월 15일 ~ 8월 15일</span></b><span style="font-family: 굴림,gulim;">&nbsp;</span></p>
        <h3 style="padding-top:35px;"><img src="/resources/img/guide/sst3.gif" alt="고객유의사항"></h3>
           <ul class="list" style="color: rgb(39, 38, 41); padding-left: 10px; font-family:;" noto="" sans="" kr",="" "nanum="" gothic",="" dotum,="" ����,="" tahoma,="" geneva,="" sans-serif;="" 14px;"=""><li style="list-style: none; padding: 5px 0px; letter-spacing: 1px; font-size: 1em;">- 반드시 예약하신 인원을 준수해 주시기 바랍니다.</li><li style="list-style: none; padding: 5px 0px; letter-spacing: 1px; font-size: 1em;">- 기준 인원 초과 시 (36개월 이상 어린이 포함) 1인당 10,000원의 추가 요금이 있으며 최대 인원을 초과하여 입실하실 수 없습 니다.</li><li style="list-style: none; padding: 5px 0px; letter-spacing: 1px; font-size: 1em;">- 펜션 입실 시간은&nbsp;<b style="color: rgb(255, 51, 0);">오후 2시 이후,</b>&nbsp;퇴실은&nbsp;<b style="color: rgb(255, 51, 0);">오전 11시</b>&nbsp;입니다.(퇴실시간 1시간 추가시 1만원)</li><li style="list-style: none; padding: 5px 0px; letter-spacing: 1px; font-size: 1em;">- 오후 10시 이후의 입실은 사전에 반드시 연락을 주시기 바랍니다.</li><li style="list-style: none; padding: 5px 0px; letter-spacing: 1px; font-size: 1em;">- 보호자를 동반하지 않은 미성년자는 어떠한 경우에도 입실하실 수 없습니다.</li><li style="list-style: none; padding: 5px 0px; letter-spacing: 1px; font-size: 1em;">- 애완동물은 부득이 타 객실 및 손님을 위해 입실을 금하오니 양해바랍니다.</li><li style="list-style: none; padding: 5px 0px; letter-spacing: 1px; font-size: 1em;">- 객실 내에서는 금연입니다. 흡연자분께서는 야외 또는 지정된 흡연장소에서 흡연을 해주시길 부탁드립니다.</li><li style="list-style: none; padding: 5px 0px; letter-spacing: 1px; font-size: 1em;">- 화재 및 냄새로 인해 다른 손님 배려 차원에서 객실 내 육류, 어류, 청국장의 조리를 금하오니 실외 지정된 장소 및 바베큐장을 이용하시길 부탁드립니다.</li><li style="list-style: none; padding: 5px 0px; letter-spacing: 1px; font-size: 1em;">- 바베큐장 이용시 <span style="color: rgb(255, 0, 0);"><strong>참숯 이용료는</strong> </span>석쇠를 포함하여 기본 <span style="color: rgb(255, 0, 0);"><strong>1회에 2만원</strong></span>입니다.(1일 2회 이용시 회당 2만원이 추가됩니다.)</li><li style="list-style: none; padding: 5px 0px; letter-spacing: 1px; font-size: 1em;">- 참숯 이용 요청은 오후 9시 까지이며, 오후 10시 이후의 바베큐장 이용을 금해주세요.</li><li style="list-style: none; padding: 5px 0px; letter-spacing: 1px; font-size: 1em;">- 우천시 바베큐 이용이 불가하오니 실내에서 드실 음식챙겨 오시면 쉬시는데 차질이 없습니다.</li><li style="list-style: none; padding: 5px 0px; letter-spacing: 1px; font-size: 1em;">- 집기 파손 시에는 펜션지기에게 알려주시기 바랍니다.</li><li style="list-style: none; padding: 5px 0px; letter-spacing: 1px; font-size: 1em;">- 퇴실시 음식물을 비롯한 모든 쓰레기는 분리수거해 주시고, 사용하신 주방기구는 세척해 주시기 바랍니다.</li><li style="list-style: none; padding: 5px 0px; letter-spacing: 1px; font-size: 1em;">- 객실 정리가 끝나시면 펜션지기에서 연락하시어 퇴실점검을 받으시기 바랍니다.</li><li style="list-style: none; padding: 5px 0px; letter-spacing: 1px; font-size: 1em;">- 다른 투숙객에게 피해를 주는 행동을 삼가부탁드립니다. (폭죽 및 불꽃놀이, 고성방가 금지)</li><li style="list-style: none; padding: 5px 0px; letter-spacing: 1px; font-size: 1em;">- 퇴실전 파손하신 물건이 있으시면 반드시 말씀해 주십시요.</li></ul>           
           <h3 style="padding-top:35px;"><img src="/resources/img/guide/sst4.gif" alt="환불규정"></h3>
            <ul class="list">
              <li>- 올바른 예약문화의 정착을 위하여 불가피한 조치이오니 양해 부탁드립니다.</li> 
              <li>- 예약완료 후 취소시 아래표와 같이 환불기준에 따라 취소수수료를 제외한 금액이 환불됩니다.</li>
              <li>- 예약 후 날짜변경을 하실 경우 예약 취소에 해당하는 위약금을 지불하셔야 하오니, 예약전 신중히 생각하시고 결정해 주시기 바랍니다. </li>
          </ul>
          
          <table width="100%" border="0" cellspacing="1" cellpadding="0" class="wideT num">
            <caption>환불규정</caption>
            <tr>
              <th width="20%" scope="col">환불금액</th>
              <th width="30%" scope="col">&nbsp;</th>
              <th width="20%" scope="col">환불금액</th>
              <th width="30%" scope="col">&nbsp;</th>
            </tr>
            <tr>
              <td class="lef">10%</td>
              <td>당일</td>
              <td class="lef">60%</td>
              <td>4일</td>
            </tr>
            <tr>
              <td class="lef">20%</td>
              <td>1일</td>
              <td class="lef">70%</td>
              <td>5일</td>
            </tr>
            <tr>
              <td class="lef">40%</td>
              <td>2일</td>
              <td class="lef">80%</td>
              <td>6일</td>
            </tr>
            <tr>
              <td class="lef">50%</td>
              <td>3일</td>
              <td class="lef">90%</td>
              <td>7일이전&amp; 기타취소</td>
            </tr>
        </table>
      </div>
    </div>	
</section> 

<%@ include file ="../include/footer.jsp" %>