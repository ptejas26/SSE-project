import express from "express";
const app = express();
app.use(express.static("public"))

app.get("/stream",(req, res) => {

    res.writeHead(200, {
        Connection: "keep-alive",
        "Cache-Control": "no-cache",
        "Content-Type": "tex/event-stream"
    });

    let counter = 0;
    const interval = setInterval(() => { 
        counter++;
        res.write(`Event: counter\n`);
        res.write(`Counter on server for your connection is: ${counter}\n\n`);

    }, 200);
    res.on("close", () => {
        clearInterval(interval);
        res.end();
    });
    
});

const listener = app.listen(process.env.PORT || 8080, ()=> {
    console.log(`Your app is listening on port ${listener.address().port}`)
});