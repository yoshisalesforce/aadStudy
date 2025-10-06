import { LightningElement } from "lwc";
import ACCOUNT_OBJECT from "@salesforce/schema/Account";
import NAME_FIELD from "@salesforce/schema/Account.Name";
import WEBSITE_FIELD from "@salesforce/schema/Account.Website";
import { createRecord } from "lightning/uiRecordApi";
const acc = {
  apiName: ACCOUNT_OBJECT.objectApiName,
  fields: {
    [NAME_FIELD.fieldApiName]: null,
    [WEBSITE_FIELD.fieldApiName]: null
  }
}
const acc2 = {
  apiName: ACCOUNT_OBJECT.objectApiName,
  fields: {
    [NAME_FIELD.fieldApiName]: null,
    [WEBSITE_FIELD.fieldApiName]: null
  }
}

/**
 * Creates Account records.
 */
export default class AccountCreator extends LightningElement {
  accountObject = ACCOUNT_OBJECT;
  nameField = NAME_FIELD;
  websiteField = WEBSITE_FIELD;
  row = 2; // 行数を設定
  accList = [acc, acc2];


  async create() {
    acc.fields[NAME_FIELD.fieldApiName] = this.nameField;
    acc.fields[WEBSITE_FIELD.fieldApiName] = this.websiteField;
    // const fields = {};
    // fields[NAME_FIELD.fieldApiName] = this.nameField;
    // fields[WEBSITE_FIELD.fieldApiName] = this.websiteField;
    // const recordInput = { apiName: ACCOUNT_OBJECT.objectApiName, fields };
    // console.log(recordInput);
    try {
      const account = await createRecord(accList);
    } catch (e) {
      console.log(e);
    }

  }
}