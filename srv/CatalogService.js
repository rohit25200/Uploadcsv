const cds = require('@sap/cds');

module.exports = cds.service.impl(async function () {
    const { Order } = this.entities;

    this.on('FileUploader', async (req) => {
        const data = JSON.parse(req.data.data);
        const lines = data.split('\n');
        const headers = lines[0].split(';');
        const array = [];
        for (let i = 1; i < lines.length; i++) {
            const line = lines[i].split(';');
            const lineData = {};
            for (let j = 0; j < headers.length; j++) {
                lineData[headers[j]] = line[j];
            }
            array.push(lineData);
        }
        let returnData = await cds.run(
            INSERT.into('Order_srv.Order').entries(array)
    
        ).then((resolve,reject) =>{
            if (typeof(resolve) !== undefined) {
                return req.data;
                
            } else {
                req.error(500,"this was issue")
            }
        }).catch( err =>{
            req.error("issuse")
        });
        return returnData;
        // try {
            
        //     await this.run(
        //         INSERT.into('Order_srv.Order').entries(array)
        //     );
        //     console.log('Data uploaded to Order entity:', array);
        //     return "FileUploader action executed successfully.";
        // } catch (error) {
        //     console.error('Error uploading data:', error);
        //     throw new Error('Error occurred while uploading data.');
        // }
    });

    this.on('Edit', Order, async (req) => {
        console.log(req.params);
        console.log(req.data.S_NO)
       console.log(req.data)
        console.log(req.context.query)
        
        const { S_NO } = req.data;

        try {

            let qry = UPDATE(Order).set({ S_NO }).where(req.params);
            console.logO(qry);
            await cds.transaction(req)
                .run(UPDATE(Order).set({ S_NO }).where(req.params));

            console.log('S_NO updated successfully:', S_NO);

            // Return a success message or any desired response
            return 'S_NO updated successfully';
        } catch (error) {
            console.error('Error occurred while executing HelloWorld action:', error);
            throw new Error('Failed to update S_NO');
        }

        
    
       
    });
});
    