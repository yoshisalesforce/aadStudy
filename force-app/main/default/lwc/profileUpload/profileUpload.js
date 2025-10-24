import { LightningElement, api } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
export default class ProfileUpload extends LightningElement {
  @api recordId;
  message = 'ファイルがアップロードされました';
  handleUploadFinished(event) {
    console.log('起動');
    console.log('event:', event);
    console.log('event.detail:', event.detail);
    console.log('event.detail.files:', event.detail.files);

    const toastMessage = new ShowToastEvent({
      title: this.message,
      message: event.detail.files.name + ' files uploaded',
      variant: 'Success'
    });
    this.dispatchEvent(toastMessage);
  }
}