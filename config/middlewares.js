module.exports = [
  'strapi::errors',
  // 'strapi::security',
  'strapi::poweredBy',
  'strapi::cors',
  {
    name: 'strapi::security',
    config: {
      // enabled:true,
      // headers:'*',
      // origin:["http://localhost:1337", "https://abs-nyark-strapi-backend-production.up.railway.app/"],
      
      contentSecurityPolicy: {
        useDefaults: true,
        directives: {
          'connect-src': ["'self'", 'https:'],
          'img-src': ["'self'", 'data:', 'blob:', 'res.cloudinary.com'],
          'media-src': ["'self'", 'data:', 'blob:', 'res.cloudinary.com'],
          upgradeInsecureRequests: null,
        },
      },
    },
  },


  'strapi::logger',
  'strapi::query',
  'strapi::body',
  'strapi::session',
  'strapi::favicon',
  'strapi::public',
];
