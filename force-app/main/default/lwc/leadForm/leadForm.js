import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import LEAD from '@salesforce/schema/Lead';
import NAME from '@salesforce/schema/Lead.Name';
import COMPANY from '@salesforce/schema/Lead.Company';
import EMAIL from '@salesforce/schema/Lead.Email';


export default class LeadForm extends LightningElement {
  obj = LEAD;
  fields = [NAME, COMPANY, EMAIL];
  // handleSuccess(event) {
  //   const toastEvent = new ShowToastEvent({
  //       title: "Lead created",
  //       message: "Record ID: " + event.detail.id,
  //       variant: "success"
  //   });
  //   this.dispatchEvent(toastEvent);
  // }
  // handleError(error){
  //   const toastEvent = new ShowToastEvent({
  //     title : "Error creating record",
  //     message : error,
  //     variant : "error"
  //   });
  //   this.dispatchEvent(toastEvent);
  // }

}