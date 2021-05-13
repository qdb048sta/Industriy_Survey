//Risky Jobs Census
//43 years
cd "D:\User_Data\Desktop\kan-2\industrial_census\"
import delimited "risky_jobs - 43y.csv", encoding("utf-8") clear
drop if 縣市=="台北市區" | 縣市=="陽明山管理局"
gen year=43
rename mingingm minging_company
rename plasticsandrubberproductsmanufac plasticsandrubbermanufacturing_m
rename v25 plasticsandrubbermanufacturing_f
rename nonmetallicmineralproductmanufac nonmetallicmineralm
rename v27 nonmetallicmineralf
rename fabricatedmetalproductmanufactur fabricatedmetalmanufacturingm
rename v31 fabricatedmetalmanufacturingf
rename transportationequipmentmanufactu transportationmanufacturingm
rename v35 transportationmanufacturingf
rename merchantwholesalersdurablegoods_ wholesalersdurablegoodsm
rename v39 wholesalersdurablegoodsf
rename merchantwholesalersnondurablegoo wholesalersnondurablegoodsm
rename v41 wholesalersnondurablegoodsf
rename buildingmaterialandgardenequipme buildingmaterialdealersm
rename v45 buildingmaterialsdealerf
rename transitandgroundpassengertranspo groundpassengerm
rename v61 groundpassengerf
rename servicesincidentaltotransportati transportationservicem
rename v63 transportationservicef
rename publishingindustriesexceptintern publishingm
rename v69 publishingf
rename professionalscientificandtechnic professionalm
rename v77 professionalf
rename automotiverepairandmaintenanceex automotiverepairm
rename v87 automotiverepairf



replace minging_company=0 if missing(minging_company)
drop mingingf
gen mingingm=round((minging_company/428)*46065) //46065 is the total amount of male minging workers
gen mingingf=round((minging_company/428)*9531) //9531 is the total amount of male minging workers
replace huntingm=0 if missing(huntingm)
replace huntingf=0 if missing(huntingf)

drop animalproduct* oilandgasextraction* supportactivitiesformining* 
drop supportactivitiesforagriculturea v11// v11 is supoort activities for agriculture
gen total_employee_m= agriculturem+fishingm+forestorym+huntingm+mingingm+constructionm+cartransportationm+boattransportationm+transportationservicem+warehousingm+total_manufacturingm+utilitiesm+gasm+waterm+merchantm+otherm
gen total_employee_f= agriculturef+fishingf+forestoryf+huntingf+mingingf+constructionf+cartransportationf+boattransportationf+transportationservicef+warehousingf+total_manufacturingf+utilitiesf+gasm+waterf+merchantf+otherf
save risky_jobs_43y,replace
/*reference:
Agriculture: REPORT OF THE 1956 SAMPLE SAMPLE CENSUS OF AGRICULTURE
Note: Fishing Forestry Transportation are derived from Industrial Censusm, but the report already declared that the numbers could be inaccurate
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
replace fishingm=0 if missing(fishingm)
replace fishingf=0 if missing(fishingf)
replace forestoryM=0 if missing(forestoryM)
replace forestoryf=0 if missing(forestoryf)
art entertainment 影劇業 台求娛樂服務業 其他娛樂服務業 
accommodation  (8231) 旅馆业

save risky_jobs_50y,replace
*/
/*
Reference:
Agriculture resoure 國家圖書館: https://twinfo.ncl.edu.tw/sgp/hypage.cgi?hyqstr=aiknpggfcecflgkibfefihgeqiejgheidjehldqkehihckdhghjiqhphkkeihdpjjidhifhiggqjkhheogheeedgcegecghefebgdedeggkejeifhhhifjfgshkjfeqedgddjieiqhjhnjchkeogcdjidiqhjhnjchkeoikdjhigodjhhkdhshoiqhrhqgoeeebfhiegqjmhiikgopljiolpkjcnepkknlcplmpodpjlgnopjkknppjkqngpilbocpikclldjiciqhjhkjghphfgoihhkfhiegqkfilifgceqdhkcgsifkjihedgodjiciqihijkfegeofhiegqjhhmhgjnhhecgodjiciqhjhkjghphfgdeqdhkcgshhjkhihnjfegeofhhihcjehlibjchkhggoeeebfhighqkdihgqjdimeokbhhdhkehsidkfgshqkdhhhgkdeqeb

Note:
Fishing: no 50y data
Forestory : no 50y data
Hunting: no 50y data
*/

//55years
import delimited "risky_jobs - 55y.csv", encoding("utf-8") clear
drop if 縣市=="台北市區" | 縣市=="陽明山管理局"
gen year=55
rename cartransportationm car_amount
rename cartransportationf car_capacity
rename boattransportationm boat_amount
rename boattransportationf boat_capacity
rename warehousingm warehouse_amount
rename warehousingf warehouse_capacity
drop animalproduct*

//rename totalindustcensusm totalindust_employee
//drop totalindustcensusf

replace agriculturem=agriculturem*20 // 5% sample x20times 
replace agriculturef=agriculturef*20
replace huntingm=0 if missing(huntingm)
replace huntingf=0 if missing(huntingf)
replace mingingm=0 if missing(mingingm)
replace mingingf=0 if missing(mingingf)
replace forestorym=0 if missing(forestorym)
replace forestoryf=0 if missing(forestoryf)
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

gen total_employee_m= agriculturem+fishingm+forestorym+huntingm+mingingm+constructionm+cartransportationm+boattransportationm+transportationservicem+warehousingm+total_manufacturingm+utilitiesm+merchantm+otherm
gen total_employee_f= agriculturef+fishingf+forestoryf+huntingf+mingingf+constructionf+cartransportationf+boattransportationf+transportationservicef+warehousingf+total_manufacturingf+utilitiesf+merchantf+otherf

save risky_jobs_55y,replace
/*
Estimation: 

cartransportation=total bus+truck capacity  in one city/ bus+truck capacity of whole Taiwan, it will get a ratio
*/


/*
Reference:
Agriculture: REPORT ON THE 1966 CENSUS OF AGRICULTURE TAIWAN, REPUBLIC OF CHINA
Fishing resource:  國家圖書館 https://twinfo.ncl.edu.tw/sgp/hypage.cgi?HYPAGE=search/detail.hpg&dtd_id=22&g=&sysid=00001113&sflag=1 page 246

*/
//65years
import delimited "risky_jobs - 65y.csv", encoding("utf-8") clear
gen year=65
rename fishingm fishing_total
rename aquaculturem aquaculture_total
drop fishingf
drop aquaculturef
drop animalproduct*

replace huntingm=0 if missing(huntingm)
replace huntingf=0 if missing(huntingf)
gen fishingm=round(fishing_total*((77637+41768+101821)/(147983+79223+191501))) //total male employee in fishing distributed by total "employee(male+female)" of city
gen fishingf=round(fishing_total*((70346+37455+89680)/(147983+79223+191501)))
gen aquaculturem=round(aquaculture_total*(23933+988+618)/(37196+1337+669)) // total male employee in aquaculture distributed by total "employee (male+female)" of city
gen aquaculturef=round(aquaculture_total*(13263+349+51)/(37196+1337+669))


replace forestorym=0 if missing(forestorym)
replace forestoryf=0 if missing(forestoryf)
replace othertransportationm=0 if missing(othertransportationm)
replace othertransportationf=0 if missing(othertransportationf)



save risky_jobs_65y,replace
use risky_jobs_43y,clear
append using risky_jobs_55y
append using risky_jobs_65y
keep 縣市 year *m *f
save risky_jobs_append,replace






