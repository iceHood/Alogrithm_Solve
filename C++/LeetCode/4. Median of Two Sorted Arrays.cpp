#include <iostream>
#include <vector>
#include <algorithm>
#include <cstdlib>
#include <ctime>
using namespace std;

class Solution {
public:
    double findMedianSortedArrays(vector<int>& nums1, vector<int>& nums2) {
        int nums1_length = nums1.size();
        int nums2_length = nums2.size();
        int mid_idx = (nums1_length + nums2_length) / 2 + 1;
        int arr[mid_idx];
        for (int i = 0, j = 0, t = 0; i < mid_idx; i++) {
            int n1 = j == nums1_length ? INT_MAX : nums1[j];
            int n2 = t == nums2_length ? INT_MAX : nums2[t];
            arr[i] = n1 < n2 ? nums1[j++]: nums2[t++];
            
        }
        if ((nums1_length + nums2_length) % 2) {
            return arr[mid_idx-1];
        } else return (arr[mid_idx-1] + arr[mid_idx-2]) / 2.;
    }
};
//class Solution {
//public:
//    double findMedianSortedArrays(vector<int>& nums1, vector<int>& nums2) {
//        nums1.insert(nums1.end(), nums2.begin(), nums2.end());
//        sort(nums1.begin(), nums1.end());
//        int length = nums1.size();
//        if (length % 2) {
//            return nums1[length / 2];
//        } else return (nums1[length / 2] + nums1[length / 2 - 1]) / 2.;
//    }
//};
int main() {
    Solution s;
    vector<int> a;
    a.push_back(1);
    a.push_back(2);
    vector<int> b;
    b.push_back(3);
    b.push_back(4);
//    cout << s.findMedianSortedArrays(a, b);
    int num1[1000] = {832590, 230989, 200656, 925465, 683758, 761548, 633953, 988347, 244846, 955094, 384451, 24136, 391834, 189276, 406746, 778775, 361422, 720404, 498919, 998307, 175553, 30982, 114066, 893060, 153435, 835487, 385310, 44353, 300533, 407998, 913407, 731014, 465972, 53837, 115440, 91178, 231848, 519807, 178591, 242301, 444551, 238079, 760077, 193156, 928301, 729244, 170209, 929773, 433340, 874010, 126065, 315655, 837362, 256223, 350298, 49526, 506593, 668078, 142463, 497451, 859742, 614656, 378120, 139744, 89585, 758054, 881253, 254386, 81066, 186749, 796920, 276190, 757043, 969559, 46473, 606999, 119927, 93541, 197029, 992770, 984370, 115018, 330348, 18644, 927924, 66060, 795517, 782595, 893408, 35508, 467149, 570333, 306617, 834591, 186847, 344618, 419904, 247761, 838597, 681821, 682146, 991998, 237330, 564283, 55472, 385232, 137371, 278867, 419189, 545346, 911190, 633186, 166600, 925213, 810554, 255249, 312097, 744618, 531215, 834788, 915145, 406969, 261393, 137281, 3662, 41572, 80221, 945601, 523581, 173756, 601516, 746948, 689724, 90194, 206095, 800432, 709856, 391311, 813640, 875159, 884970, 490828, 178232, 993709, 110722, 789663, 48714, 218544, 629736, 842066, 305036, 759226, 547174, 771029, 413949, 799146, 183003, 728496, 943329, 49011, 503838, 388693, 551089, 629642, 938781, 324280, 803733, 219482, 984826, 442644, 386676, 56781, 868888, 894631, 630472, 633209, 137466, 650639, 484785, 510125, 955268, 994956, 672207, 879450, 438530, 624866, 37475, 388751, 915973, 241588, 243033, 879993, 749444, 1709, 392023, 190600, 155446, 224758, 493373, 84318, 443968, 295242, 751606, 546202, 991782, 951097, 652910, 254567, 607873, 365278, 826776, 38064, 405189, 679498, 894367, 755453, 960111, 330602, 294388, 508100, 583280, 188699, 340358, 13917, 652239, 573460, 705488, 460681, 615665, 139762, 805912, 81307, 930536, 340689, 438320, 223649, 792131, 944939, 529972, 272256, 145675, 688524, 296716, 843232, 441928, 722290, 36108, 873652, 2682, 602325, 960676, 630206, 761061, 524162, 723474, 269984, 826422, 309854, 840205, 195142, 814196, 824901, 607870, 596710, 992481, 422032, 721243, 870207, 518939, 223760, 764632, 328027, 840040, 645079, 238858, 311530, 673402, 352269, 86426, 824284, 680617, 634749, 141056, 533518, 711636, 41751, 396768, 269061, 70941, 441260, 882721, 21308, 493836, 565755, 534998, 144777, 413873, 300346, 958796, 866737, 529019, 894826, 471937, 951605, 200380, 950097, 12042, 735327, 67483, 856411, 135431, 377548, 363703, 762109, 53166, 623418, 465585, 884770, 394771, 398512, 440131, 952086, 409375, 719687, 875810, 401888, 771134, 538596, 50639, 632674, 563310, 20369, 597342, 402551, 884686, 763909, 62022, 641232, 467785, 213763, 74976, 922086, 824807, 873788, 201808, 94526, 586062, 593751, 761495, 626067, 619349, 154160, 266200, 335065, 614424, 771564, 579946, 416933, 850399, 670733, 602434, 395795, 433681, 820576, 27767, 258955, 817236, 725578, 352183, 602468, 391672, 170710, 231071, 511409, 822898, 217859, 144859, 928960, 811053, 161990, 154076, 892968, 615581, 2384, 994201, 219723, 106252, 530872, 21417, 926384, 343146, 341240, 180646, 848107, 249424, 303721, 999852, 807626, 730710, 825281, 525716, 70910, 499322, 881200, 315222, 388657, 100761, 135587, 633439, 405062, 244628, 492931, 876769, 525797, 991735, 996930, 864381, 153372, 900527, 191057, 62762, 965492, 956800, 448395, 482381, 235797, 742692, 71059, 398015, 41907, 818167, 766491, 514156, 418560, 333155, 88615, 444573, 960302, 50950, 580776, 702755, 71545, 738168, 7826, 941365, 897154, 155343, 811745, 36355, 156929, 57094, 996854, 698345, 893644, 738511, 472246, 404492, 858095, 256184, 758228, 221096, 818656, 256453, 49099, 467594, 172829, 979446, 944496, 638787, 58863, 24623, 706043, 947932, 133704, 918760, 554175, 650861, 816347, 915926, 734406, 591484, 190889, 90281, 627177, 919579, 567901, 80971, 432112, 737835, 732898, 299917, 220748, 947898, 409666, 428382, 681547, 763885, 694639, 25075, 842737, 46028, 156249, 885787, 636395, 538411, 371602, 859539, 200264, 934958, 919643, 554799, 261540, 158978, 945193, 703257, 11657, 590630, 383460, 244071, 804664, 417513, 33182, 175468, 186962, 43193, 169821, 447120, 644527, 102586, 338778, 518565, 32011, 474943, 617480, 602393, 116491, 637950, 649396, 80402, 307577, 737475, 43414, 650438, 990140, 485004, 139093, 840904, 534129, 737916, 172054, 729035, 739707, 20133, 763515, 872893, 625609, 908981, 801678, 416971, 764422, 352019, 22443, 176955, 630828, 373257, 943715, 515091, 731119, 922613, 806154, 172001, 948436, 856066, 744228, 909564, 72221, 701909, 236635, 123144, 626872, 238181, 925124, 739763, 369577, 943926, 959856, 393091, 67736, 385740, 48271, 889211, 944961, 395958, 647678, 791228, 146981, 582276, 419771, 658160, 938302, 602026, 32970, 941130, 959594, 164356, 790915, 659873, 604458, 332980, 743780, 344990, 607935, 622691, 28946, 176867, 11297, 820786, 453831, 911030, 859511, 202000, 294052, 309880, 427216, 341091, 134849, 145818, 175126, 650152, 593214, 153132, 950725, 197912, 409266, 202137, 437515, 895454, 735419, 59588, 325189, 622673, 926289, 125868, 44086, 497257, 988138, 320506, 880631, 993889, 33253, 126645, 29531, 980867, 350539, 172930, 526331, 838597, 246151, 813688, 660566, 181717, 406061, 290650, 930796, 172650, 125717, 679127, 123235, 117253, 129347, 244300, 286612, 971415, 678236, 794282, 532019, 691018, 457618, 955483, 843815, 544985, 619647, 11847, 873157, 51696, 818594, 877960, 874928, 581539, 74816, 712241, 320335, 969702, 743989, 5611, 245900, 851637, 846725, 249614, 355089, 716573, 62462, 91825, 399238, 695402, 979640, 650291, 895973, 194303, 993799, 720762, 970076, 41715, 929483, 266549, 302313, 241527, 860642, 483680, 87618, 405694, 291091, 704396, 422474, 313998, 412425, 380452, 212858, 710864, 946384, 752684, 826085, 719489, 414629, 810410, 958245, 451356, 809083, 346585, 564952, 466664, 333436, 431942, 955009, 980973, 630707, 355213, 186170, 730425, 813141, 25148, 443269, 982372, 336980, 799152, 502919, 832034, 571707, 339280, 516084, 776187, 807322, 471530, 791424, 425997, 242936, 435104, 601064, 711536, 753200, 430629, 727552, 401125, 317319, 754516, 338404, 414212, 609288, 309797, 440717, 563063, 402027, 828255, 239072, 271658, 749386, 722327, 628748, 495327, 501111, 942834, 575499, 20106, 248217, 222360, 43853, 675388, 942425, 296025, 110179, 223867, 417324, 305768, 28089, 590626, 590465, 795788, 554742, 235173, 935122, 433871, 791761, 800713, 786716, 102790, 560417, 891025, 159896, 555661, 902274, 593066, 224030, 538376, 625385, 446218, 413590, 555196, 229928, 845133, 749553, 690586, 346346, 448421, 972398, 928178, 998349, 574977, 970548, 732499, 713610, 338455, 382488, 631456, 901582, 75542, 645085, 95956, 873330, 269972, 800291, 712743, 399161, 277705, 163365, 421673, 534430, 565664, 440961, 326158, 325298, 541085, 57014, 918314, 701589, 137447, 526480, 2279, 945719, 963536, 237032, 838951, 325029, 586226, 292515, 317655, 933708, 631341, 970401, 451725, 232688, 596560, 795535, 410172, 850470, 422041, 392461, 854071, 304907, 887809, 631787, 961701, 904327, 566297, 107210, 448889, 489977, 177126, 610802, 634785, 25837, 885525, 728839, 681659, 113459, 347132, 168757, 971100, 867054, 4442, 932228, 982644, 139643, 90750, 978474, 763316, 471663, 648762, 711259, 114618, 190052, 202840, 227896, 670086, 29363, 294288, 406209, 382866, 109507, 344311, 597968, 252979, 386224, 922835, 133251, 17070, 537879, 858058, 852545, 500130, 164477, 973290, 710639, 607829, 95084, 427186, 534553, 918650, 215846, 145059, 367972, 720075, 136048, 481624, 50257, 622183, 955432, 471575, 311531, 846150, 34698, 427593, 933336, 963265, 785741, 65863, 359710, 88782, 666267, 10062, 668921, 903282, 442847, 884946, 573501, 429259, 459165, 811379, 874532, 990140, 744851, 109433, 497614, 829995, 779261, 611701, 216433, 115798, 965175, 899196, 611880, 753678, 433709, 960125, 150298, 649380, 493205, 128294, 942696, 328873, 766448};
    
    int num2[1000] = {472400, 911193, 566492, 26017, 925441, 391686, 312886, 929853, 215871, 708820, 546430, 148829, 168333, 654900, 917947, 598447, 482926, 827764, 5863, 224581, 804352, 53543, 321193, 832274, 791724, 320316, 438738, 264578, 338507, 705291, 782847, 797725, 588052, 253936, 293700, 72013, 51329, 246638, 285369, 462002, 608829, 734598, 930848, 957594, 811057, 806580, 653409, 319904, 79978, 57351, 102498, 529839, 354263, 934826, 806326, 730811, 550206, 187622, 822847, 602822, 839976, 738041, 667025, 778310, 563124, 224190, 954710, 494663, 930533, 416220, 760854, 826809, 100658, 67777, 996768, 101644, 515921, 659600, 532084, 243096, 79349, 871631, 945414, 724751, 626369, 496141, 531907, 821896, 863109, 656452, 146444, 364991, 487584, 967489, 362137, 847758, 94538, 838564, 246606, 766396, 715374, 330082, 232268, 922826, 415587, 737264, 92403, 272780, 450045, 820605, 494695, 804723, 327996, 492598, 54021, 165354, 583329, 947392, 998893, 956410, 100924, 597023, 56274, 990398, 768768, 133416, 906663, 872271, 330074, 256908, 422374, 569395, 215476, 582390, 507897, 350176, 30862, 318601, 603772, 404640, 488940, 331895, 791432, 316032, 747445, 47675, 144525, 763584, 174538, 38028, 195534, 293992, 312598, 229952, 773421, 127004, 522367, 792157, 593375, 32457, 179925, 434251, 379414, 852871, 330734, 334195, 759728, 566792, 75830, 232513, 352830, 37502, 45427, 987644, 380008, 357131, 861768, 625458, 442417, 414692, 649677, 622651, 103231, 252980, 852910, 928893, 982117, 422422, 960936, 42600, 227940, 935638, 48199, 232746, 858808, 230331, 234095, 784886, 67875, 11156, 253254, 27000, 731770, 220811, 23519, 653259, 255853, 463702, 923276, 523986, 757052, 664000, 178308, 722721, 2767, 986545, 95452, 617981, 787439, 998692, 956643, 947463, 713092, 303860, 928220, 821858, 871297, 204747, 360922, 52955, 963097, 861330, 798603, 767059, 484794, 746890, 597533, 69063, 131919, 589019, 237037, 215747, 345700, 184064, 646402, 140631, 875907, 13316, 56124, 373385, 381329, 277148, 583292, 433581, 821768, 67707, 703163, 620707, 145052, 797696, 500064, 659995, 990831, 117492, 534674, 493674, 209376, 282189, 963477, 125556, 256000, 123509, 295538, 733421, 4976, 227075, 711673, 351321, 900132, 264673, 413146, 505242, 568225, 976495, 450445, 442123, 799432, 925902, 311664, 332168, 990519, 75201, 914168, 559697, 647076, 186696, 41345, 619302, 971312, 129080, 424160, 814161, 174877, 879457, 48539, 889042, 263497, 200629, 769309, 207329, 487058, 209438, 903979, 847785, 337820, 422424, 398784, 480272, 410217, 420448, 992031, 272860, 950453, 788075, 396807, 719346, 262685, 439748, 844428, 46098, 385681, 647729, 275264, 74575, 972919, 337298, 480914, 388272, 593404, 484052, 508702, 750434, 737549, 554776, 944201, 27195, 645351, 248333, 819326, 778968, 806843, 999963, 474011, 183891, 194489, 120848, 276872, 641285, 531861, 463969, 986483, 827401, 122372, 401181, 224597, 482370, 470040, 606855, 790363, 747817, 903212, 830864, 921903, 745608, 717341, 260251, 324, 793472, 909459, 248455, 421348, 445276, 831136, 45245, 785861, 751833, 737760, 805991, 285002, 425104, 27973, 79662, 342729, 182099, 783761, 307281, 297391, 484143, 172388, 89138, 376596, 116947, 96077, 411599, 493675, 89863, 507959, 447723, 16896, 912041, 476643, 170352, 841991, 946424, 248818, 184653, 4848, 749781, 480955, 131248, 275037, 379249, 529595, 569339, 726818, 791377, 952052, 84159, 904780, 194701, 921764, 810474, 875828, 860762, 813756, 292731, 869408, 360361, 270635, 748251, 568770, 850492, 157796, 337896, 792201, 177212, 77533, 315758, 888392, 237165, 49435, 904416, 82772, 206141, 493871, 397067, 548736, 407645, 641953, 707796, 117165, 386882, 65542, 506987, 841104, 993793, 768825, 738946, 807638, 821598, 209663, 206903, 806551, 216377, 293522, 898225, 951399, 935436, 617377, 772061, 646353, 870050, 261751, 776871, 201975, 276540, 167161, 327469, 969874, 496349, 928552, 808317, 610867, 68571, 918388, 76985, 338128, 148424, 923704, 497361, 92730, 62877, 626458, 109079, 591634, 773094, 301692, 921672, 809125, 493198, 120994, 355002, 404039, 603582, 280802, 390343, 560744, 241611, 823051, 741437, 450336, 734218, 981982, 860309, 131640, 683540, 164273, 377353, 767106, 353459, 719454, 573396, 875031, 642353, 488680, 482977, 111931, 880915, 135826, 412387, 734073, 977026, 790387, 938877, 949837, 839697, 461065, 444798, 824131, 287363, 182419, 335576, 280860, 749408, 112733, 238819, 651415, 176172, 943779, 471823, 632767, 169112, 97274, 245154, 816613, 906543, 413265, 618695, 821051, 692807, 473523, 775263, 10187, 720956, 585404, 218084, 841109, 838279, 623867, 691072, 167721, 386920, 394, 646535, 229305, 932706, 580043, 962657, 580794, 280815, 35167, 303133, 191700, 485851, 163438, 370926, 568176, 575497, 43629, 429898, 694893, 420005, 860266, 374078, 398183, 743996, 315863, 159196, 262916, 118601, 451565, 998496, 356771, 718126, 763464, 891678, 559806, 967828, 786300, 746794, 714793, 512003, 746548, 633036, 588413, 178624, 662683, 298371, 745266, 643619, 627898, 683156, 878141, 211203, 560891, 137449, 439461, 593039, 574390, 53521, 413580, 878039, 943427, 413974, 439842, 271363, 830554, 275209, 551676, 828115, 117251, 877606, 809082, 275796, 51884, 288975, 21098, 140689, 875113, 19403, 35282, 442927, 110497, 172326, 497160, 614812, 117981, 516142, 621886, 143594, 31442, 881771, 15425, 90410, 413769, 510437, 568748, 997445, 309656, 525358, 714297, 996160, 373047, 410820, 401022, 686533, 485528, 120, 873931, 34790, 914806, 185653, 172884, 866129, 160511, 731153, 505189, 478532, 888609, 847622, 289685, 64240, 23688, 24235, 900056, 503871, 467067, 559284, 700913, 733164, 136580, 650235, 512792, 366059, 322916, 282595, 607548, 356307, 36023, 885776, 424100, 361504, 238239, 855732, 313779, 853679, 185647, 953803, 344606, 852042, 751147, 640310, 904810, 474018, 965351, 219211, 607899, 69727, 357741, 391196, 470782, 445451, 563748, 794959, 916801, 882250, 655248, 226353, 761555, 487206, 387156, 931361, 628425, 711449, 143710, 526126, 112486, 449973, 889106, 703522, 429527, 748739, 652347, 664920, 585058, 220720, 539581, 737982, 662150, 745474, 606488, 764156, 519551, 394153, 134043, 530154, 43011, 286146, 541516, 330820, 641653, 802786, 85126, 411531, 436801, 129486, 3111, 558593, 271042, 236231, 75486, 642561, 934165, 455049, 880759, 242595, 854893, 280304, 893828, 567727, 969946, 188799, 386289, 761355, 668037, 483095, 129841, 637102, 851988, 881178, 476384, 686515, 155584, 463764, 91939, 876318, 716752, 592764, 762433, 727222, 216351, 145783, 327357, 799371, 775847, 29716, 699314, 316447, 268869, 954346, 540029, 921315, 391707, 547594, 789112, 786433, 403816, 851603, 861216, 530136, 40689, 145748, 469074, 932375, 220667, 938053, 269979, 114738, 910883, 332422, 888947, 929604, 8559, 528363, 966344, 842588, 341916, 964546, 713976, 609857, 373730, 90994, 107747, 447507, 418374, 854407, 160765, 525498, 776410, 715596, 771046, 609794, 957548, 924161, 737711, 524772, 893760, 424851, 5837, 649832, 210602, 765407, 556246, 61044, 1546, 986100, 641184, 74080, 608809, 825291, 79669, 455236, 973027, 925844, 559180, 406466, 283052, 256734, 292268, 887451, 674089, 40817, 880048, 400866, 920878, 935075, 401145, 801864, 757505, 908145, 652492, 994511, 233949, 76682, 287681, 168580, 952563, 938379, 719342, 549727, 420223, 679863, 400242, 335723, 490611, 287192, 748017, 101998, 210894, 731812, 374013, 554114, 908788, 210507, 95055, 818973, 507160, 627228, 384087, 477307, 238702, 601388, 512721, 773617, 922550, 519402, 699201, 459330, 495160, 851907, 198778, 396280, 707063, 221896, 119900, 9948, 41989, 977891, 597033, 106282, 441940, 433061, 789460, 121310, 232415, 239408, 899012, 374859, 916245, 212777, 112696, 612588, 864218, 251894, 988015, 860596, 220592, 396675, 214150, 926882, 171155, 163667, 666767, 119624, 565443, 97164, 704031, 75788, 974781, 626790, 848869, 826323, 230943, 815041, 856489, 335258, 924149, 233929, 807640, 135118};
    
    sort(&num1[0], &num1[1000]);
    sort(&num2[0], &num2[1000]);
//    cout << s.findMedianSortedArrays(a, b);
    srand((unsigned int)time(NULL));
    for (int i = 0; i < 1000; i++) {
        printf("%d, ", num1[i]);
    }
    cout << endl;
    cout << endl;
    for (int i = 0; i < 1000; i++) {
        printf("%d, ", num2[i]);
    }
     //seed값으로 현재시간 부여
    
    
    return 0;
}