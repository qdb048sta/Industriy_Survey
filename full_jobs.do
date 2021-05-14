//Risky Jobs Census
//43 years
cd "D:\User_Data\Desktop\kan-2\industrial_census\"
/*import delimited "empty_csv - 1954.csv", encoding("utf-8") clear
drop if 縣市=="台北市區" | 縣市=="陽明山管理局"
rename 縣市 county
gen year=43
rename coalmining_m minging_company
rename plasticsandrubberproductsmanufac plasticsandrubbermanufacturing_m
rename v25 plasticsandrubbermanufacturing_f
rename nonmetallicmineralproductmanufac nonmetallicmineralm
rename v27 nonmetallicmineralf
rename fabricatedmetalproductmanufactur fabricatedmetal_m
rename v31 fabricatedmetal_f
rename transportationequipmentmanufactu transportationmanufacturing_m
rename v35 transportationmanufacturing_f
rename merchantwholesalersdurablegoods_ wholesalersdurablegoods_m
rename v39 wholesalersdurablegoods_f
rename merchantwholesalersnondurablegoo wholesalersnondurablegoods_m
rename v41 wholesalersnondurablegoods_f
rename buildingmaterialandgardenequipme buildingmaterialdealers_m
rename v45 buildingmaterialsdealer_f
rename transitandgroundpassengertranspo groundpassenger_m
rename v63 groundpassenger_f
rename servicesincidentaltotransportati transportationservice_m
rename v65 transportationservice_f
rename publishingindustriesexceptintern publishing_m
rename v71 publishing_f
rename professionalscientificandtechnic professional_m
rename v81 professional_f
rename managementadministrativeandwaste managementadmin_m
rename v83 management_admin_f
rename artsentertainmentandrecreation_m entertainment_m_1
rename artsentertainmentandrecreation_f entertainment_f_1
rename v90 entertainment_m_2
rename v91 entertainment_f_2
rename v92 entertainment_m_3
rename v93 entertainment_f_3  
rename automotiverepairandmaintenanceex automotiverepair_m
rename v97 automotiverepair_f
rename religiousgrantmakingcivicprofess religious_m
rename v101 religious_f



replace minging_company=0 if missing(minging_company)
drop coalmining_f
gen coalmining_m=round((minging_company/428)*31276) //31276 is the total amount of male minging workers
gen coalmining_f=round((minging_company/428)*4841) //4841 is the total amount of male minging workers
replace animalproduction_m=0 if missing(animalproduction_m)
replace animalproduction_f=0 if missing(animalproduction_f)
replace foodandbeveragestores_m=foodandbeveragestores_m+foodandbeveragestores_m_1
replace foodandbeveragestores_f=foodandbeveragestores_f+foodandbeveragestores_f_1
gen entertainment_m=entertainment_m_1+entertainment_m_2+entertainment_m_3
gen entertainment_f=entertainment_f_1+entertainment_f_2+entertainment_f_3
gen financeandinsurance_m=financeandinsurance_m_1+financeandinsurance_m_2+financeandinsurance_m_3
gen financeandinsurance_f=financeandinsurance_f_1+financeandinsurance_f_2+financeandinsurance_f_3


drop animalproduct* oilandgasextraction* supportactivitiesformining* foodandbeveragestores_m_1 foodandbeveragestores_f_1 entertainment_m_1 entertainment_m_2 entertainment_m_3 entertainment_f_1 entertainment_f_2 entertainment_f_3
drop supportactivitiesforagriculturea v11*/ // v11 is supoort activities for cropproduction
//gen total_employee_m= cropproduction_m+fishinghuntingandtrapping_m+logging_m+coalminging_m+construction_m+cartransportationm+boattransportationm+transportationservicem+warehousingm+total_manufacturingm+utilitiesm+gasm+waterm+merchantm+otherm
//gen total_employee_f= croproduction_f+fishinghuntingandtrapping_f+logging_f+constructionf+cartransportation_f+boattransportationf+transportationservicef+warehousingf+total_manufacturingf+utilitiesf+gasm+waterf+merchantf+otherf
/*foreach v of varlist county-construction_m{
	replace `v'=0 if missing(`v')
}*/
//save full_jobs_43y,replace
/*reference:
cropproduction: REPORT OF THE 1956 SAMPLE SAMPLE CENSUS OF cropproduction
Note: fishinghuntingandtrapping Forestry Transportation are derived from Industrial Censusm, but the report already declared that the numbers could be inaccurate
Estimation:
Minging: (minging company/428)*46065
minging company is recorded cities by cities, then divided by 428(total companies in Taiwan) it will get a ratio representing how large the minging companies in one city compared to Taiwan, then x total male minging employee
Estimation:
food manufacturing:(43y0201102131)
chemical manufacturing:3111-               3199 3181*need revision
Plastic 3011- 3099
Nonmetalic 3311-3399 
primary 3411-3421
frabricated 3511- 3599
machineary 3611- 3699 
Trasnportationmanufacturing 3811- 3899
WoodPrdouction 2500-2599 
food and beverage stores: 飲食和冷飲業
Publishing 8311
Finance_1_2_ 3 : note: 商業銀行及儲蓄業+典當業+保險業


*/

//50 years
/*import delimited "risky_jobs - 50y.csv", encoding("utf-8") clear
replace huntingm=0 if missing(huntingm)
replace huntingf=0 if missing(huntingf)
replace fishinghuntingandtrappingm=0 if missing(fishinghuntingandtrappingm)
replace fishinghuntingandtrappingf=0 if missing(fishinghuntingandtrappingf)
replace loggingM=0 if missing(loggingM)
replace loggingf=0 if missing(loggingf)
art entertainment 影劇業 台求娛樂服務業 其他娛樂服務業 
accommodation  (8231) 旅馆业

save risky_jobs_50y,replace
*/
/*
Reference:
cropproduction resoure 國家圖書館: https://twinfo.ncl.edu.tw/sgp/hypage.cgi?hyqstr=aiknpggfcecflgkibfefihgeqiejgheidjehldqkehihckdhghjiqhphkkeihdpjjidhifhiggqjkhheogheeedgcegecghefebgdedeggkejeifhhhifjfgshkjfeqedgddjieiqhjhnjchkeogcdjidiqhjhnjchkeoikdjhigodjhhkdhshoiqhrhqgoeeebfhiegqjmhiikgopljiolpkjcnepkknlcplmpodpjlgnopjkknppjkqngpilbocpikclldjiciqhjhkjghphfgoihhkfhiegqkfilifgceqdhkcgsifkjihedgodjiciqihijkfegeofhiegqjhhmhgjnhhecgodjiciqhjhkjghphfgdeqdhkcgshhjkhihnjfegeofhhihcjehlibjchkhggoeeebfhighqkdihgqjdimeokbhhdhkehsidkfgshqkdhhhgkdeqeb

Note:
fishinghuntingandtrapping: no 50y data
logging : no 50y data
Hunting: no 50y data
*/

//55years
import delimited "empty_csv - 1966.csv", encoding("utf-8") clear
rename v1 county
drop if county=="台北市區" | county=="陽明山管理局"
gen year=55
rename plasticsandrubberproductsmanufac plasticsandrubbermanufacturing_m
rename v27 plasticsandrubbermanufacturing_f
rename nonmetallicmineralproductmanufac nonmetallicmineralm
rename v29 nonmetallicmineralf
rename fabricatedmetalproductmanufactur fabricatedmetal_m
rename v33 fabricatedmetal_f
rename transportationequipmentmanufactu transportationmanufacturing_m
rename v37 transportationmanufacturing_f
rename merchantwholesalersdurablegoods_ wholesalersdurablegoods_m
rename v41 wholesalersdurablegoods_f
rename merchantwholesalersnondurablegoo wholesalersnondurablegoods_m
rename v43 wholesalersnondurablegoods_f
rename buildingmaterialandgardenequipme buildingmaterialdealers_m
rename v47 buildingmaterialsdealer_f
rename transitandgroundpassengertranspo groundpassenger_m
rename v63 groundpassenger_f
rename servicesincidentaltotransportati transportationservice_m
rename v65 transportationservice_f
rename publishingindustriesexceptintern publishing_m
rename v71 publishing_f
rename professionalscientificandtechnic professional_m
rename v77 professional_f
rename managementadministrativeandwaste managementadmin_m
rename v79 management_admin_f
rename artsentertainmentandrecreation_m entertainment_m
rename artsentertainmentandrecreation_f entertainment_f

rename automotiverepairandmaintenanceex automotiverepair_m
rename v89 automotiverepair_f
rename religiousgrantmakingcivicprofess religious_m
rename v93 religious_f

//
//manufacturing
rename foodmanufacturing_m foodmanufacturingt
drop foodmanufacturing_f
gen foodmanufacturing_m=foodmanufacturingt*(72656/118535)
gen foodmanufacturing_f=foodmanufacturingt*(45879/118535)
rename chemicalmanufacturing_m chemicalmanufacturingt
drop chemicalmanufacturing_f
gen chemicalmanufacturing_m=chemicalmanufacturingt*(39873/58805)
gen chemicalmanufacturing_f=chemicalmanufacturingt*(18932/58805)
rename plasticsandrubbermanufacturing_m plasticandrubbert
drop plasticsandrubbermanufacturing_f
gen plasticandrubbber_m=plasticandrubber*(5401/9908)
gen plasticandrubber_f=plasticandrubber*(4507/9908)
rename nonmetallicmineralm nonmetalicminearalt
drop nonmetallicmineralf
gen nonmetalicminearl_m=nonmetalicminearalt*(33327/45211)
gen nonmetalicminearl_f=nonmetalicminearalt*(11884/45211)
rename primarymetalmanufacturing_m primarymetalt
drop primarymetalmanufacturing_f
gen primarymetal_m=primarymetalt*(14751/15821)
gen primarymetal_f=primarymetalt*(1073/15821)
rename machinerymanufacturing_m machinearymanufacturingt
drop machinerymanufacturing_f
gen machinenarymanufacturing_m=machinearymanufacturingt*(30710/32343)
gen machinearymanufacturing_f=machinearymanufacturingt*(1633/32343)

rename transportationmanufacturing_m transportationequipmentt
drop transportationmanufacturing_f
gen transportationequipment_m=transportationequipmentt*(29069/30681)
gen transportationequipment_f=transportationequipmentt*(1792/30681)

rename woodproductmanufacturing_m woodproductiont
drop woodproductmanufacturing_f
gen woodproduction_m=woodproductiont*(23996/32725)
gen woodproduction_f=woodproductiont*(8729/32725)



//

//rename totalindustcensusm totalindust_employee
//drop totalindustcensusf
replace cropproduction_m=cropproduction_m*20 // 5% sample x20times 
replace cropproduction_f=cropproduction_f*20
replace huntingm=0 if missing(huntingm)
replace huntingf=0 if missing(huntingf)
replace coalmining_m=0 if missing(mingingm)
replace coalmining_f=0 if missing(mingingf)
replace coalmining_m=coalmining_m*(66819/84814)
replace coalmining_f=coalmining_f*(66819/84814)
replace loggingm=0 if missing(loggingm)
replace loggingf=0 if missing(loggingf)
replace railtransportationm=0 if missing(railtransportationm)
replace railtransportationf=0 if missing(railtransportationf)
replace car_amount=0 if missing(car_amount)
replace car_capacity=0 if missing(car_capacity)
replace boat_amount=0 if missing(boat_amount)
replace boat_capacity=0 if missing(boat_capacity)
replace transportationservicem=0 if missing(transportationservicem)
replace transportationservicef=0 if missing(transportationservicef)
replace othertransportationm=0 if missing(othertransportationm)
replace othertransportationf=0 if missing(othertransportationf)
replace warehouse_amount=0 if missing(warehouse_amount)
replace warehouse_capacity=0 if missing(warehouse_capacity)


replace airtransportationm=0 if missing(airtransportationm)
replace airtransportationf=0 if missing(airtransportationf)

gen cartransportationm=round((car_capacity/218854)*(11813+26844)) //total male employee in car transportation distributed by car capacity of city
gen cartransportationf=round((car_capacity/218854)*(8510+936)) //total female employee in car transportation distributed by car capacity of city
gen boattransportationm=round((boat_capacity/1365634)*(7239)) //total male employee in boat transportation distributed by car capacity of city
gen boattransportationf=round((boat_capacity/1365634)*(243)) //total male employee in boat transportation distributed by car capacity of city
gen warehousingm=round((warehouse_amount/1119179)*(1292))
gen warehousingf=round((warehouse_amount/1119179)*(168)) // total female employee in warehouse distributed by warehouse space of city

gen total_employee_m= cropproductionm+fishinghuntingandtrappingm+loggingm+huntingm+mingingm+constructionm+cartransportationm+boattransportationm+transportationservicem+warehousingm+total_manufacturingm+utilitiesm+merchantm+otherm
gen total_employee_f= cropproductionf+fishinghuntingandtrappingf+loggingf+huntingf+mingingf+constructionf+cartransportationf+boattransportationf+transportationservicef+warehousingf+total_manufacturingf+utilitiesf+merchantf+otherf

save full_jobs_55y,replace
/*
Estimation: 

cartransportation=total bus+truck capacity  in one city/ bus+truck capacity of whole Taiwan, it will get a ratio
*/


/*
Reference:
cropproduction: REPORT ON THE 1966 CENSUS OF cropproduction TAIWAN, REPUBLIC OF CHINA
fishinghuntingandtrapping resource:  國家圖書館 https://twinfo.ncl.edu.tw/sgp/hypage.cgi?HYPAGE=search/detail.hpg&dtd_id=22&g=&sysid=00001113&sflag=1 page 246

*/
//65years
import delimited "empty_csv - 1976.csv", encoding("utf-8") clear
gen year=65
rename fishinghuntingandtrappingm fishinghuntingandtrapping_total
rename aquaculturem aquaculture_total
rename coalminging_M minging_M
rename coalminging_F minging_F
gen coalminingm=minging_M*(42526/66077)
gen coalminingf=minging_F*(42526/66077)
drop fishinghuntingandtrappingf
drop aquaculturef
drop animalproduct*

replace huntingm=0 if missing(huntingm)
replace huntingf=0 if missing(huntingf)
gen fishinghuntingandtrappingm=round(fishinghuntingandtrapping_total*((77637+41768+101821)/(147983+79223+191501))) //total male employee in fishinghuntingandtrapping distributed by total "employee(male+female)" of city
gen fishinghuntingandtrappingf=round(fishinghuntingandtrapping_total*((70346+37455+89680)/(147983+79223+191501)))
gen aquaculturem=round(aquaculture_total*(23933+988+618)/(37196+1337+669)) // total male employee in aquaculture distributed by total "employee (male+female)" of city
gen aquaculturef=round(aquaculture_total*(13263+349+51)/(37196+1337+669))


replace loggingm=0 if missing(loggingm)
replace loggingf=0 if missing(loggingf)
replace othertransportationm=0 if missing(othertransportationm)
replace othertransportationf=0 if missing(othertransportationf)






save full_jobs_65y,replace
use full_jobs_43y,clear
append using full_jobs_55y
append using full_jobs_65y
keep 縣市 year *m *f
save full_jobs_append,replace






