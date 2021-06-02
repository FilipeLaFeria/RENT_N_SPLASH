import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["unicorn", "flamingo", "pizza", "crocodile", "swan", "pineapple"],
    typeSpeed: 75,
    loop: true
  });
}

export { loadDynamicBannerText };
