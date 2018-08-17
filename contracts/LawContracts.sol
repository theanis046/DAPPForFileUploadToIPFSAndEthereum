// pragma solidity ^0.4.24;

// contract LawContracts{

//     struct identity {
//         string hashAddress;
//         string name;
//     }

//     uint public hashcount;

//     struct document{
//         identity owner;
//         string name;
//         string docHash;
//         identity[] signee;
//     }

//     mapping(uint => document) documents;

//     document[] public docs;

//     constructor() public{
//         hashcount = 0;
//     }

//     function addDocument(string documentHash,string documentName, string userAddress,string userName) public {
//         identity memory ownerIdentity = identity(userAddress, userName);
//         docs.length++;
//         document storage doc = docs[docs.length-1];

//         ownerIdentity.hashAddress = userAddress;
//         ownerIdentity.name = userName;
//         doc.owner = ownerIdentity;
//         doc.name = documentName;
//         doc.docHash = documentHash;

//         docs.push(doc);
//         hashcount++;

//     }

//     function signTheDocument(string documentHash, string userAddress, string username) public
//     {
//         for (uint i=0 ; i<hashcount; i++) {
//             if(keccak256(docs[i].docHash) == keccak256(documentHash))
//             {
//                 identity memory ownerIdentity = identity(userAddress, username);
//                 docs[i].signee.push(ownerIdentity);
//             }
//         }
//     }
//     function getdocument(uint i) public view returns(string){
//         return docs[i].docHash;
//     }
// }



pragma solidity ^0.4.24;

contract LawContracts{

    struct identity {
        address hashAddress;
        string name;
    }
    struct documentAndSignees{
        string documentHash;
        identity signee;
    }
    struct documentAndOwner{
        string documentHash;
        identity owner;
    }
    
    mapping (string => documentAndOwner)  documentMapping;
    string[] public documentIds;
    
    
    mapping (string => identity[])  signeeMapping;
    
    
    
    documentAndSignees[]  signeelst;
    documentAndOwner[]  documentslst;
    
    
    uint documentMappingIterator;
    

    constructor() public{
       
        documentMappingIterator = 0;
    }
    

    function addDocument(string documentHash, address userHash, string userName) public returns(string)
    {
        identity memory ownerIdentity;
        ownerIdentity.hashAddress = userHash;
        ownerIdentity.name = userName;
        documentAndOwner memory docu;
        docu.documentHash = documentHash;
        docu.owner = ownerIdentity;
        documentMapping[documentHash] = docu;
        documentMappingIterator++;
        
        //Document IDs list
        documentIds.push(documentHash);
        
        //Signee list update
        identity[] signeeList;
        identity memory signeeIdentity;
        signeeIdentity.hashAddress = userHash;
        signeeIdentity.name = userName;
        signeeList.push(signeeIdentity);
        
        signeeMapping[documentHash] = signeeList;
        
        return "Hash Added";
    }
    
    function getDocument(string ind) public view returns(string,string){
        string memory name = documentMapping[ind].owner.name;
        return (documentMapping[ind].documentHash,name);
    }
    
    function getdocumentsCount() view public returns (uint) {
        return documentIds.length-1;
    }
    
    function getSigneeListCount(string docHash) view public returns(uint){
        identity[] storage userSigningIdentities =  signeeMapping[docHash];
        return userSigningIdentities.length;
    }
    
    function getSigneeListByHashAndIndex(string docHash, uint index) view public returns(string){
        identity[] storage userSigningIdentities =  signeeMapping[docHash];
        return userSigningIdentities[index].name;
    }
    
    function signContract(string docHash, address userHash, string userName) public payable returns(string){
        
        identity storage signeeIdentity;
        signeeIdentity.hashAddress = userHash;
        signeeIdentity.name = userName;
        signeeMapping[docHash].push(signeeIdentity);
        return "success";
    }
    
    

    //function addDocument(string documentHash,string documentName, string userAddress,string userName) public {
   //     identity memory ownerIdentity = identity(userAddress, userName);
    //    docs.length++;
    //    document storage doc = docs[docs.length-1];

    //    ownerIdentity.hashAddress = userAddress;
    //    ownerIdentity.name = userName;
    //    doc.owner = ownerIdentity;
   //     doc.name = documentName;
   //     doc.docHash = documentHash;

  //      docs.push(doc);
  //      hashcount++;

 //   }

    //function signTheDocument(string documentHash, string userAddress, string username) public
//    {
 //       for (uint i=0 ; i<hashcount; i++) {
 //           if(keccak256(docs[i].docHash) == keccak256(documentHash))
 //           {
 //               identity memory ownerIdentity = identity(userAddress, username);
 //               docs[i].signee.push(ownerIdentity);
 //           }
 //       }
 //   }
 //   function getdocument(uint i) public view returns(string){
 //       document dd=  docs[i];
 //       uint signeeL = dd.signee.length-1;
 //       string ree;
 //       for(uint a=0; a<signeeL;a++)
  //      {
//            ree = dd.signee[a].hashAddress;
//        }
//        return ree;
//    }
}