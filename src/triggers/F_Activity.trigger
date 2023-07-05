trigger F_Activity on FieloRO__Activity__c (before insert, after insert, before update, after update){
	if(Trigger.isBefore){
		if(Trigger.isInsert){
			FieloPLT.SObjectService.setMemberId(Trigger.new);
		}else if(Trigger.isUpdate){
			FieloPLT.SObjectService.setMemberId(Trigger.new, Trigger.oldMap);
		}
	}
	if(Trigger.isAfter){
		if(Trigger.isInsert){
			FieloPLT.SObjectService.processRecords(Trigger.new, null);
		}else if(Trigger.isUpdate){
			FieloPLT.SObjectService.processRecords(Trigger.new, Trigger.oldMap);
		}
	}
}