module.exports = {
    "env": {
        "browser": true,
        "es2021": true
    },
    "extends": [
        "eslint:recommended",
        "plugin:react/recommended",
        'plugin:import/recommended',
        'plugin:import/errors',
        'plugin:import/warnings',
        "plugin:@typescript-eslint/recommended",
        "eslint-config-airbnb-base",
        "prettier"
    ],
    "overrides": [
    ],
    "parser": "@typescript-eslint/parser",
    "parserOptions": {
        "ecmaVersion": "latest",
        "sourceType": "module"
    },
    "plugins": [
        "react",
        "@typescript-eslint",
        "prettier"
    ],
    "rules": {
        "prettier/prettier": "error"
    }
    ,"settings":{
        "react":{
            "version": "detect"
        }
    }
}
