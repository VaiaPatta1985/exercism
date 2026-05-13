#include "list_ops.h"

list_t *new_list(size_t length, list_element_t elements[]){
    list_t *newlist=malloc(sizeof(size_t)+sizeof(list_element_t)*length);
    
    newlist->length=length;
    for(int idx=0;idx<(int)length;idx++){
        newlist->elements[idx]=elements[idx];
    }
    return newlist;
}
list_t *append_list(list_t *list1, list_t *list2){
    int initial_length = (int)(list1->length+list2->length);
    list_t *appendlist=new_list(initial_length, list1->elements);
    int length1 = (int)(list1->length);
        for(int idx=length1;idx<initial_length;idx++){
            appendlist->elements[idx]=list2->elements[idx-length1];
        }
    return appendlist;
}
list_t *conatenate_list(list_t **list, int num_lists){
    list_element_t undefined_element=(list_element_t)0;
    list_element_t empty[1]={undefined_element};
    if(num_lists){
        list_t *conlist=list[0];
        for(int idx=1;idx<num_lists;idx++){
            conlist=append_list(conlist, list[idx]);
        }
        return conlist;
    }else{
        return new_list(0, empty);
    }
}
list_t *filter_list(list_t *list, bool (*filter)(list_element_t)){
    list_element_t undefined_element=(list_element_t)0;
    list_element_t empty[1]={undefined_element};
    list_t *filterlist=new_list(0, empty);
    int total_length = (int)(list->length);
    for(int idx=0;idx<total_length;idx++){
        if(filter(list->elements[idx])){
            filterlist->length+=(size_t)1;
            filterlist=realloc(filterlist, sizeof(size_t)+sizeof(list_element_t)*(filterlist->length));
            filterlist->elements[filterlist->length-1]=list->elements[idx];
        }
    }
    return filterlist;
}
size_t length_list(list_t *list){
    return list->length;
}
list_t *map_list(list_t *list, list_element_t (*map)(list_element_t)){
    int listlength = (int)(list->length);
    list_element_t undefined_element=(list_element_t)0;
    list_element_t empty[1]={undefined_element};
    list_t *maplist = new_list(listlength, empty);
    for(int idx=0;idx<listlength;idx++){
        maplist->elements[idx]=map(list->elements[idx]);
    }
    return maplist;
}
list_element_t foldl_list(list_t *list, list_element_t initial, list_element_t (*foldl)(list_element_t, list_element_t)){
    int total_length = (int)(list->length);
    for(int idx=0;idx<total_length;idx++){
        initial = foldl(initial, list->elements[idx]);
    }
    return initial;
}
list_element_t foldr_list(list_t *list, list_element_t initial, list_element_t (*foldr)(list_element_t, list_element_t)){
    int total_length = (int)(list->length);
    for(int idx=total_length-1;idx>=0;idx--){
        initial = foldr(list->elements[idx], initial);
    }
    return initial;
}
list_t *reverse_list(list_t *list){
    int listlength = (int)(list->length);
    list_element_t undefined_element=(list_element_t)0;
    list_element_t empty[1]={undefined_element};
    list_t *reverselist = new_list(listlength, empty);
    for(int idx=0;idx<listlength;idx++){
        reverselist->elements[idx]=list->elements[listlength-idx-1];
    }
    return reverselist;
    
}
void delete_list(list_t *list){
    free(list);
}
