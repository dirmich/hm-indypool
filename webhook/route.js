const app = require('express').Router()

app.post('/webhooks/topic/:topic/',(req,res)=>{
    const wallet_id = req.headers['x-walllet-id']    
    console.log(`POST ${req.params.topic}`)
    if (wallet_id) console.log('for wallet:',wallet_id)
    if (req.body) console.log('payload: ',req.body)
    res.status(200).send()
})

module.exports = app