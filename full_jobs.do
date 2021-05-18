
//43 years
cd "D:\User_Data\Desktop\kan-2\industrial_census\"
import delimited "empty_csv - 1954.csv", encoding("utf-8") clear
drop if 縣市=="台北市區" | 縣市=="陽明山管理局"
rename 縣市 county
gen year=43
rename coalmining_m minging_company
rename plasticsandrubberproductsmanufac plasticandrubber_m
rename v25 plasticandrubber_f
rename nonmetallicmineralproductmanufac nonmetallicmineral_m
rename v27 nonmetallicmineral_f
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

rename primarymetalmanufacturing_m primarymetal_m
rename primarymetalmanufacturing_f primarymetal_f
rename transportationmanufacturing_m transportationequipment_m
rename transportationmanufacturing_f transportationequipment_f
rename woodproductmanufacturing_m woodproduction_m
rename woodproductmanufacturing_f woodproduction_f

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
replace utilities_m=utilities_m+gas_m+water_m
replace utilities_f=utilities_f+gas_f+water_f

drop animalproduct* oilandgasextraction* supportactivitiesformining* foodandbeveragestores_m_1 foodandbeveragestores_f_1 entertainment_m_1 entertainment_m_2 entertainment_m_3 entertainment_f_1 entertainment_f_2 entertainment_f_3
drop supportactivitiesforagriculturea v11* // v11 is supoort activities for cropproduction
//gen total_employee_m= cropproduction_m+fishinghuntingandtrapping_m+logging_m+coalminging_m+construction_m+cartransportationm+boattransportationm+transportationservicem+warehousingm+total_manufacturingm+utilitiesm+gasm+waterm+merchantm+otherm
//gen total_employee_f= croproduction_f+fishinghuntingandtrapping_f+logging_f+constructionf+cartransportation_f+boattransportationf+transportationservicef+warehousingf+total_manufacturingf+utilitiesf+gasm+waterf+merchantf+otherf
/*foreach v of varlist county-construction_m{
	replace `v'=0 if missing(`v')
}*/
save full_jobs_43y,replace

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
gen foodmanufacturing_m=round(foodmanufacturingt*(72656/118535))
gen foodmanufacturing_f=round(foodmanufacturingt*(45879/118535))
rename chemicalmanufacturing_m chemicalmanufacturingt
drop chemicalmanufacturing_f
gen chemicalmanufacturing_m=round(chemicalmanufacturingt*(39873/58805))
gen chemicalmanufacturing_f=round(chemicalmanufacturingt*(18932/58805))
rename plasticsandrubbermanufacturing_m plasticandrubbert
drop plasticsandrubbermanufacturing_f
gen plasticandrubber_m=round(plasticandrubbert*(5401/9908))
gen plasticandrubber_f=round(plasticandrubbert*(4507/9908))
rename nonmetallicmineralm nonmetalicminearalt
drop nonmetallicmineralf
gen nonmetallicmineral_m=round(nonmetalicminearalt*(33327/45211))
gen nonmetallicmineral_f=round(nonmetalicminearalt*(11884/45211))
rename primarymetalmanufacturing_m primarymetalt
drop primarymetalmanufacturing_f
gen primarymetal_m=round(primarymetalt*(14751/15821))
gen primarymetal_f=round(primarymetalt*(1073/15821))
rename machinerymanufacturing_m machinearymanufacturingt
drop machinerymanufacturing_f
gen machinerymanufacturing_m=round(machinearymanufacturingt*(30710/32343))
gen machinerymanufacturing_f=round(machinearymanufacturingt*(1633/32343))

rename transportationmanufacturing_m transportationequipmentt
drop transportationmanufacturing_f
gen transportationequipment_m=round(transportationequipmentt*(29069/30681))
gen transportationequipment_f=round(transportationequipmentt*(1792/30681))

rename woodproductmanufacturing_m woodproductiont
drop woodproductmanufacturing_f
gen woodproduction_m=round(woodproductiont*(23996/32725))
gen woodproduction_f=round(woodproductiont*(8729/32725))

rename fabricatedmetal_m fabricatedmetalt
drop fabricatedmetal_f
gen fabricatedmetal_m=round(fabricatedmetalt*(14751/15824))
gen fabricatedmetal_f=round(fabricatedmetalt*(1073/15824))


//

//rename totalindustcensusm totalindust_employee
//drop totalindustcensusf
replace cropproduction_m=cropproduction_m*20 // 5% sample x20times 
replace cropproduction_f=cropproduction_f*20
replace animalproduction_m=0 if missing(animalproduction_m)
replace animalproduction_f=0 if missing(animalproduction_f)
replace coalmining_m=0 if missing(coalmining_m)
replace coalmining_f=0 if missing(coalmining_f)
replace coalmining_m=round(coalmining_m*(66819/84814))
replace coalmining_f=round(coalmining_f*(66819/84814))
replace logging_m=0 if missing(logging_m)
replace logging_f=0 if missing(logging_f)
replace railtransportation_m=0 if missing(railtransportation_m)
replace railtransportation_f=0 if missing(railtransportation_f)
rename trucktransportation_m truck_capacity
replace truck_capacity=0 if missing(truck_capacity)
drop trucktransportation_f
gen trucktransportation_m=round((truck_capacity/218854)*(11813+26844)) //total male employee in car transportation distributed by car capacity of city
gen trucktransportation_f=round((truck_capacity/218854)*(8510+936)) //total female employee in car transportation distributed by car capacity of city
//replace car_amount=0 if missing(car_amount)
rename watertransportation_m boat_capacity
drop watertransportation_f
replace boat_capacity=0 if missing(boat_capacity)
gen watertransportation_m=round((boat_capacity/1365634)*(7239)) //total male employee in boat transportation distributed by car capacity of city
gen watertransportation_f=round((boat_capacity/1365634)*(243)) //total male employee in boat transportation distributed by car capacity of city
replace transportationservice_m=0 if missing(transportationservice_m)
replace transportationservice_f=0 if missing(transportationservice_f)
//replace othertransportationm=0 if missing(othertransportationm)
//replace othertransportationf=0 if missing(othertransportationf)
rename warehousingandstorage_m warehouse_capacity
//replace warehouse_amount=0 if missing(warehouse_amount)
replace warehouse_capacity=0 if missing(warehouse_capacity)
drop warehousingandstorage_f

replace airtransportation_m=0 if missing(airtransportation_m)
replace airtransportation_f=0 if missing(airtransportation_f)

/*gen cartransportationm=round((car_capacity/218854)*(11813+26844)) //total male employee in car transportation distributed by car capacity of city
gen cartransportationf=round((car_capacity/218854)*(8510+936)) //total female employee in car transportation distributed by car capacity of city
gen boattransportationm=round((boat_capacity/1365634)*(7239)) //total male employee in boat transportation distributed by car capacity of city
gen boattransportationf=round((boat_capacity/1365634)*(243)) */ //total male employee in boat transportation distributed by car capacity of city
gen warehousingandstorage_m=round((warehouse_capacity/1119179)*(1292))
gen warehousingandstorage_f=round((warehouse_capacity/1119179)*(168)) // total female employee in warehouse distributed by warehouse space of city


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
rename v1 county
gen year=65
rename fishinghuntingandtrapping_m fishinghuntingandtrapping_total
rename aquaculture_m aquaculture_total
rename coalmining_m mining_m
rename coalmining_f mining_f
gen coalmining_m=round(mining_m*(42526/66077))
gen coalmining_f=round(mining_f*(42526/66077))
drop fishinghuntingandtrapping_f
drop aquaculture_f
drop animalproduct*

//
rename plasticsandrubberproductsmanufac plasticandrubber_m
rename v27 plasticandrubber_f
rename nonmetallicmineralproductmanufac nonmetallicmineral_m
rename v29 nonmetallicmineral_f
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
rename artsentertainmentandrecreation_m entertainment_m_1
rename artsentertainmentandrecreation_f entertainment_f_1
/*rename v90 entertainment_m_2
rename v91 entertainment_f_2
rename v92 entertainment_m_3
rename v93 entertainment_f_3 */ 
rename automotiverepairandmaintenanceex automotiverepair_m
rename v89 automotiverepair_f
rename religiousgrantmakingcivicprofess religious_m
rename v93 religious_f

rename primarymetalmanufacturing_m primarymetal_m
rename primarymetalmanufacturing_f primarymetal_f
rename transportationmanufacturing_m transportationequipment_m
rename transportationmanufacturing_f transportationequipment_f
rename woodproductmanufacturing_m woodproduction_m
rename woodproductmanufacturing_f woodproduction_f

gen fishinghuntingandtrapping_m=round(fishinghuntingandtrapping_total*((77637+41768+101821)/(147983+79223+191501))) //total male employee in fishinghuntingandtrapping distributed by total "employee(male+female)" of city
gen fishinghuntingandtrapping_f=round(fishinghuntingandtrapping_total*((70346+37455+89680)/(147983+79223+191501)))
gen aquaculture_m=round(aquaculture_total*(23933+988+618)/(37196+1337+669)) // total male employee in aquaculture distributed by total "employee (male+female)" of city
gen aquaculture_f=round(aquaculture_total*(13263+349+51)/(37196+1337+669))


replace logging_m=0 if missing(logging_m)
replace logging_f=0 if missing(logging_f)
//replace othertransportationm=0 if missing(othertransportationm)
//replace othertransportationf=0 if missing(othertransportationf)





save full_jobs_65y,replace
use full_jobs_43y,clear
append using full_jobs_55y,force
append using full_jobs_65y,force
#delimit ;
global VAR "
cropproduction_m cropproduction_f logging_m logging_f fishinghuntingandtrapping_m fishinghuntingandtrapping_f minging_company construction_m construction_f foodmanufacturing_m foodmanufacturing_f chemicalmanufacturing_m chemicalmanufacturing_f plasticandrubber_m plasticandrubber_f nonmetallicmineral_m nonmetallicmineral_f primarymetal_m primarymetal_f fabricatedmetal_m fabricatedmetal_f machinerymanufacturing_m machinerymanufacturing_f transportationequipment_m transportationequipment_f woodproduction_m woodproduction_f wholesalersdurablegoods_m wholesalersdurablegoods_f wholesalersnondurablegoods_m wholesalersnondurablegoods_f motorvehicleandpartsdealers_m motorvehicleandpartsdealers_f buildingmaterialdealers_m buildingmaterialsdealer_f foodandbeveragestores_m foodandbeveragestores_f gasolinestations_m gasolinestations_f miscellaneousstoreretailers_m miscellaneousstoreretailers_f airtransportation_m airtransportation_f railtransportation_m railtransportation_f watertransportation_m watertransportation_f trucktransportation_m trucktransportation_f groundpassenger_m groundpassenger_f transportationservice_m transportationservice_f warehousingandstorage_m warehousingandstorage_f utilities_m utilities_f publishing_m publishing_f financeandinsurance_m_1 financeandinsurance_f_1 financeandinsurance_m_2 financeandinsurance_f_2 financeandinsurance_m_3 financeandinsurance_f_3 realestateandrentalandleasing_m realestateandrentalandleasing_f professional_m professional_f managementadmin_m management_admin_f educationalservices_m educationalservices_f healthcareandsocialassistance_m healthcareandsocialassistance_f accommodationandfoodservices_m accommodationandfoodservices_f automotiverepair_m automotiverepair_f personalandlaundryservices_m personalandlaundryservices_f religious_m religious_f gas_m gas_f water_m water_f year coalmining_m coalmining_f entertainment_m entertainment_f financeandinsurance_m financeandinsurance_f animalproduction_m animalproduction_f aquaculture_m aquaculture_f supportactivitiesforagriculturea v13 oilandgasextraction_m oilandgasextraction_f supportactivitiesformining_m supportactivitiesformining_f foodmanufacturingt chemicalmanufacturingt plasticandrubbert nonmetalicminearalt primarymetalt fabricatedmetalt machinearymanufacturingt transportationequipmentt woodproductiont boat_capacity truck_capacity warehouse_capacity total_manufacturing_m total_manufacturing_f merchant_m merchant_f other_m other_f fishinghuntingandtrapping_total aquaculture_total mining_m mining_f entertainment_m_1 entertainment_f_1
";
#delimit cr

foreach v of global VAR{
	replace `v'=0 if missing(`v')
}
gen total_employee_m=0
foreach v of global VAR{
	replace total_employee_m=total_employee_m+`v'
	
}
keep county year *m *f 
drop gas_* water_* supportactivitiesformining_* merchant_* other_* mining_* total_manufacturing*
save full_jobs_append,replace






