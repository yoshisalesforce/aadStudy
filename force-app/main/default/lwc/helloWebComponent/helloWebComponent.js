import { LightningElement } from 'lwc';

export function handleFieldChange(event) {
  // イベント委譲のため、実際の入力要素を確認
  const target = event.target;
  console.log(target);
  if (target.tagName === 'LIGHTNING-INPUT') {
    const field = target.dataset.field;
    const value = target.value;
    this[field] = value;
    this.pictureUrl = value;
    console.log(this[field]);
  }
}

export default class App extends LightningElement {
  name = 'Electra X4';
  description = 'A sweet bike built for comfort.';
  category = 'Mountain';
  material = 'Steel';
  price = '$2,700';
  pictureUrl = 'https://s3-us-west-2.amazonaws.com/dev-or-devrl-s3-bucket/sample-apps/ebikes/electrax4.jpg';
  ready = false;
  connectedCallback() {
    setTimeout(() => {
      this.ready = true;
      console.log('Hi!');
    }, 3000);
    console.log('Hello!');
  }
}