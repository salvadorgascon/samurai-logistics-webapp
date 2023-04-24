import i18n from "i18next";
import { initReactI18next } from "react-i18next";


const resources = {
  en: {
    translation: {
      "welcome": "Welcome to Samurai Logistics"
    }
  },
  es: {
    translation: {
      "welcome": "Bienvenido a Samurai Logistics"
    }
  }
};

i18n
  .use(initReactI18next) // passes i18n down to react-i18next
  .init({
    resources,
    lng: "es", 
    interpolation: {
      escapeValue: false // react already safes from xss
    }
  });

  export default i18n;