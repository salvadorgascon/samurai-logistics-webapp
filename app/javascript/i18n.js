import i18n from "i18next";
import { initReactI18next } from "react-i18next";


const resources = {
  en: {
    translation: {
      "home": "Home",      
      "welcome": "Welcome to Samurai Logistics",
      "products": "Products",
      "customers": "Customers",
      "add": "Add"
    }
  },
  es: {
    translation: {
      "home": "Inicio",
      "products": "Productos",
      "customers": "Clientes",
      "welcome": "Bienvenido a Samurai Logistics",
      "add": "Añadir"
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