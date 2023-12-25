const request = require('supertest')
const app = require('./app')

describe('APIs Test',()=>{

    it('GET /healthz --> returns 200 status code',() => {
        return request(app).get('/healthz').expect(200);

    })

    it('GET /healthz --> returns content-type as JSON',() => {
        return request(app).get('/healthz').expect('Content-Type','application/json; charset=utf-8')
        
    })
})
