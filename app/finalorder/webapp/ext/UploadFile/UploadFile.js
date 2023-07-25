sap.ui.define([
    "sap/m/Dialog",
    "sap/m/Button",
    "sap/ui/core/HTML",
    "sap/m/MessageBox",
    "sap/ui/model/odata/v4/ODataModel"
], function (Dialog, Button, HTML, MessageBox, ODataModel) {
    "use strict";

    return {
        HelloWorld: async function (oBindingContext, aSelectedContexts) {
            let mParameters = {
                contexts: aSelectedContexts[0],
                label: 'Confirm',
                invocationGrouping: true
            };

            this.editFlow.invokeAction('Order_srv.Edit', mParameters).then(function (result) {
                console.log("Got " + result.getObject().value);
            });
        },

        FileUpload: async function (oEvent, Controller) {
            var fileId = "FileUploader_" + Date.now();
            var oFileUploader = new sap.ui.unified.FileUploader({
                name: "myFileUpload",
                id: fileId,
                buttonText: "Choose File",
                fileType: ["csv", "xls", "xlsx"],
                maximumFileSize: 10
            });
            var that = this;
            var oDialog = new Dialog({
                title: "Upload File",
                content: [
                    oFileUploader
                ],
                beginButton: new Button({
                    text: "Upload",
                    type: "Emphasized",
                    press: function () {

                        var file = sap.ui.getCore().byId(fileId).oFileUpload.files[0];
                        if (file) {
                            var reader = new FileReader();
                            reader.onload = async function (event) {
                                var fileContent = event.target.result;
                                console.log(fileContent);
                                var jsonData = JSON.stringify(fileContent);
                                console.log(jsonData);
                                jQuery.ajax({
                                    type: "POST",
                                    url: "/order-srv/FileUploader",
                                    data: JSON.stringify({ data: jsonData }),
                                    contentType: "application/json",
                                    success: function (response) {
                                        MessageBox.success("File uploaded successfully");
                                        console.log(response); // Backend response
                                    },
                                    error: function (jqXHR, textStatus, errorThrown) {
                                        MessageBox.error("Error occurred while uploading the file: " + errorThrown);
                                    }
                                });




                                oDialog.close();

                            };
                            reader.readAsText(file);
                        }
                    }

                }),
                endButton: new Button({
                    text: "Cancel",
                    type: "Transparent",
                    press: function () {
                        oDialog.close();
                    }
                }),
                afterClose: function () {
                    oDialog.destroy();
                }
            });

            oDialog.open();
        }
    };
});
