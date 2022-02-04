import { sendUnaryData, ServerUnaryCall, UntypedHandleCall, status, handleUnaryCall } from "@grpc/grpc-js";
import { CreateWalletReposnse, EmptyRequest, ERC20Server, GasPriceReponse, OperationStatus } from "../models/ERC20";

class ERC20GrpcService implements ERC20Server {

    [name: string]: UntypedHandleCall;

    createWallet(call: ServerUnaryCall<EmptyRequest, CreateWalletReposnse>, callback: sendUnaryData<CreateWalletReposnse>): void {

        const res: Partial<CreateWalletReposnse> = {};

        const walletAddress = global.web3.eth.accounts.create();

        res.walletAddress = walletAddress.address;
        res.privateKey = walletAddress.privateKey;
        res.operationMessage = 'success create wallet';
        res.operationStatus = OperationStatus.SUCCESS;

        callback(null, CreateWalletReposnse.fromJSON(res));
    }

    async gasPrice(call: ServerUnaryCall<EmptyRequest, GasPriceReponse>, callback: sendUnaryData<GasPriceReponse>): Promise<void> {

        const res: Partial<GasPriceReponse> = {};

        const gasPrice = await global.web3.eth.getGasPrice();
        res.gasPrice = global.web3.utils.fromWei(gasPrice, 'ether');
        res.operationStatus = OperationStatus.SUCCESS;

        callback(null, GasPriceReponse.fromJSON(res));
    }


}

export {
    ERC20GrpcService
}