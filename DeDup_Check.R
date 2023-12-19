VPK_Temp=read.csv("/Users/chapm564/Documents/GitHub/VPK_SR_Survey/DeDupCheck/VPK_Families_Final_combined_dedup_final.csv")
SR_Temp=read.csv("/Users/chapm564/Documents/GitHub/VPK_SR_Survey/DeDupCheck/SR_Families_Final_combined_dedup_final.csv")



sapply(list("SREnglish"=SREnglish, "SRSpanish"=SRSpanish, "VPKEnglish"=VPKEnglish, "VPKSpanish"=VPKSpanish, "SRCombined"=do.call(rbind, list(SREnglish,SRSpanish)),"VPKCombined"=do.call(rbind, list(VPKEnglish,VPKSpanish))),
       simplify = FALSE, USE.NAMES = TRUE, function(d){
         rbind(
           "Didn't Consent"=table(factor((d$Consent!="I agree to participate." & d$Consent!="Acepto participar."), levels=c(T,F))),
           "Failed Screener"=table(factor((d$Screener!="Yes" & d$Screener!="Sí"), levels=c(T,F))),
           "Survey Incomplete"=table(factor((d$Finished!="True"), levels=c(T,F))),
           "Dup IP"=table(factor((duplicated(d$IP.Address)), levels=c(T,F)))